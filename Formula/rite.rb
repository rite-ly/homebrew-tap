class Rite < Formula
  desc "DSL and runtime for cryptographic key ceremonies"
  homepage "https://ritely.io"
  license "GPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/rite-ly/rite/releases/download/v0.4.1/rite-0.4.1-darwin-arm64.tar.gz"
      sha256 "2960aeace0ecbcc63cdaa7391c6ef82e004f0d8c4e68517ab901a43151ec7924"
    end
    on_intel do
      url "https://github.com/rite-ly/rite/releases/download/v0.4.1/rite-0.4.1-darwin-amd64.tar.gz"
      sha256 "1ea0a1ca139a53428e97b3bbc3dcb89eb1eeee460f0898ca3ddc726f3aebc4ca"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/rite-ly/rite/releases/download/v0.4.1/rite-0.4.1-linux-amd64.tar.gz"
      sha256 "8c4216f9486f737467048ea06de31d6f955a5161292f368155a03686c3a49b53"
    end
    on_arm do
      url "https://github.com/rite-ly/rite/releases/download/v0.4.1/rite-0.4.1-linux-arm64.tar.gz"
      sha256 "6d55704c00e553dd98c809112cbad93e062f9aebaa2ac73d9a46efa8253e5ee6"
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
