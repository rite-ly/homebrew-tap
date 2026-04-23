class Rite < Formula
  desc "DSL and runtime for cryptographic key ceremonies"
  homepage "https://ritely.io"
  version "0.1.0-rc.2"
  license "GPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/rite-ly/rite/releases/download/v#{version}/rite-#{version}-darwin-arm64.tar.gz"
      sha256 "bfe85bddbab234e3f91fe12f876de6945392956d7bc3e0229c8452b4da7534e9"
    end
    on_intel do
      url "https://github.com/rite-ly/rite/releases/download/v#{version}/rite-#{version}-darwin-amd64.tar.gz"
      sha256 "1f58b34fc8d78ed676aff102bc9fd264b6da46853e7eabfffaf667f8530c834e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/rite-ly/rite/releases/download/v#{version}/rite-#{version}-linux-amd64.tar.gz"
      sha256 "acbd81e3a6f5c08785679b3efc75a319d85199081018ef0813138848ed95ae0b"
    end
    on_arm do
      url "https://github.com/rite-ly/rite/releases/download/v#{version}/rite-#{version}-linux-arm64.tar.gz"
      sha256 "461071e22e19312280650a53fface4bc484da8c6ac981b946524862e5a0a157a"
    end
  end

  def install
    bin.install "rite"
    generate_completions_from_executable(bin/"rite", "completions")
  end

  test do
    assert_match "rite #{version}", shell_output("#{bin}/rite --version")
  end
end
