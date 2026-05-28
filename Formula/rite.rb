class Rite < Formula
  desc "DSL and runtime for cryptographic key ceremonies"
  homepage "https://ritely.io"
  version "0.2.0"
  license "GPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/rite-ly/rite/releases/download/v0.2.0/rite-0.2.0-darwin-arm64.tar.gz"
      sha256 "5b02ed3b27e5df06405cd56d324e18b9e1a5ef3690d19f60f17240fde02b43fb"
    end
    on_intel do
      url "https://github.com/rite-ly/rite/releases/download/v0.2.0/rite-0.2.0-darwin-amd64.tar.gz"
      sha256 "1fc9cd39e2a75d110abac534c242aa0510e713e4cf6efaa847958761cabd18e0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/rite-ly/rite/releases/download/v0.2.0/rite-0.2.0-linux-amd64.tar.gz"
      sha256 "491e82908408f9adf185ad8c14eaabe868e9d99fefe6314698796bc284eb576d"
    end
    on_arm do
      url "https://github.com/rite-ly/rite/releases/download/v0.2.0/rite-0.2.0-linux-arm64.tar.gz"
      sha256 "ae76ff28ba9c15325b7fc14764055e5e95333c569bfb4b432bd8a22a69cdda7b"
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
