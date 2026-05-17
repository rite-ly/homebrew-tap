#!/usr/bin/env bash
# Update Formula/rite.rb URLs and SHA256s for a new rite-ly/rite release.
#
# Usage:
#   ./scripts/update-formula.sh VERSION

set -euo pipefail

REPO="rite-ly/rite"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(dirname "${SCRIPT_DIR}")"
FORMULA="${REPO_DIR}/Formula/rite.rb"
TMP_DIR="$(mktemp -d)"

cleanup() { rm -rf "${TMP_DIR}"; }
trap cleanup EXIT

VERSION="${1:?Usage: $0 VERSION}"

echo "Fetching SHA256SUMS for v${VERSION}..."
SUMS="${TMP_DIR}/SHA256SUMS"
curl -fsSL -o "${SUMS}" \
    "https://github.com/${REPO}/releases/download/v${VERSION}/SHA256SUMS"

sha_for() {
    local asset="rite-${VERSION}-${1}.tar.gz"
    local line
    if ! line=$(grep "/${asset}\$" "${SUMS}"); then
        echo "No SHA256SUMS entry for ${asset}" >&2
        exit 1
    fi
    echo "${line%% *}"
}

SHA_DARWIN_ARM64=$(sha_for darwin-arm64)
SHA_DARWIN_AMD64=$(sha_for darwin-amd64)
SHA_LINUX_AMD64=$(sha_for linux-amd64)
SHA_LINUX_ARM64=$(sha_for linux-arm64)

printf "  %-13s -> %s\n" \
    darwin-arm64 "${SHA_DARWIN_ARM64}" \
    darwin-amd64 "${SHA_DARWIN_AMD64}" \
    linux-amd64  "${SHA_LINUX_AMD64}" \
    linux-arm64  "${SHA_LINUX_ARM64}"

# Bump the version in every URL, then advance past each platform's url line
# to replace its sha256.
sed -i.bak -E \
    -e "s|releases/download/v[^/]+/rite-[^-]+-|releases/download/v${VERSION}/rite-${VERSION}-|g" \
    -e "/-darwin-arm64\.tar\.gz\"\$/{n;s|sha256 \".*\"|sha256 \"${SHA_DARWIN_ARM64}\"|;}" \
    -e "/-darwin-amd64\.tar\.gz\"\$/{n;s|sha256 \".*\"|sha256 \"${SHA_DARWIN_AMD64}\"|;}" \
    -e "/-linux-amd64\.tar\.gz\"\$/{n;s|sha256 \".*\"|sha256 \"${SHA_LINUX_AMD64}\"|;}" \
    -e "/-linux-arm64\.tar\.gz\"\$/{n;s|sha256 \".*\"|sha256 \"${SHA_LINUX_ARM64}\"|;}" \
    "${FORMULA}"
rm -f "${FORMULA}.bak"

# Sanity check: every computed sha must now appear in the formula.
for sha in "${SHA_DARWIN_ARM64}" "${SHA_DARWIN_AMD64}" "${SHA_LINUX_AMD64}" "${SHA_LINUX_ARM64}"; do
    if ! grep -q "${sha}" "${FORMULA}"; then
        echo "Rewrite failed: sha256 ${sha} not found in formula" >&2
        exit 1
    fi
done

echo "Done."
