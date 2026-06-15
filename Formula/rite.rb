class Rite < Formula
  desc "DSL and runtime for cryptographic key ceremonies"
  homepage "https://ritely.io"
  version "0.3.0"
  license "GPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/rite-ly/rite/releases/download/v0.3.0/rite-0.3.0-darwin-arm64.tar.gz"
      sha256 "8ecf2cecbd07d027a8cb107d78f92d05687d725e009c7f34c17671edc763a3d5"
    end
    on_intel do
      url "https://github.com/rite-ly/rite/releases/download/v0.3.0/rite-0.3.0-darwin-amd64.tar.gz"
      sha256 "28b5dcd2a23d84a0f7f89f5be55d1389ebbb01b67da31d97af722bed6d9f6f7d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/rite-ly/rite/releases/download/v0.3.0/rite-0.3.0-linux-amd64.tar.gz"
      sha256 "550780b486dc96bf55d4bc371171ac4e68ea7f20146a5d0590f69a387ee006be"
    end
    on_arm do
      url "https://github.com/rite-ly/rite/releases/download/v0.3.0/rite-0.3.0-linux-arm64.tar.gz"
      sha256 "908924de4f1786e3794f042e2a05eca48b8a1b56d41b25cb82823ea2f304e847"
    end
  end

  def install
    bin.install "rite"
    generate_completions_from_executable(bin/"rite", "completions")
  end

  test do
    assert_match "cryptographic key ceremonies", shell_output("#{bin}/rite --help")
  end
end
