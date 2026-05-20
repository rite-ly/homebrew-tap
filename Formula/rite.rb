class Rite < Formula
  desc "DSL and runtime for cryptographic key ceremonies"
  homepage "https://ritely.io"
  version "0.1.2"
  license "GPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/rite-ly/rite/releases/download/v0.1.2/rite-0.1.2-darwin-arm64.tar.gz"
      sha256 "a100cdf28e7f69576edc7326fc1fd43a8125f61c98f33ad37e8a48f2b9149ad7"
    end
    on_intel do
      url "https://github.com/rite-ly/rite/releases/download/v0.1.2/rite-0.1.2-darwin-amd64.tar.gz"
      sha256 "41bde115a3cb70701ffa36038f711f6a20bb2c9d5b80c4885c9f445f270919d0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/rite-ly/rite/releases/download/v0.1.2/rite-0.1.2-linux-amd64.tar.gz"
      sha256 "bdebb22d1fbfdc928e0fad821dea9bce91e374c370a5b1b03bdff380b8717cd6"
    end
    on_arm do
      url "https://github.com/rite-ly/rite/releases/download/v0.1.2/rite-0.1.2-linux-arm64.tar.gz"
      sha256 "63d64845c5e7bbc69e488c08a43788a07242950c2570e051aee1d43e54f61f16"
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
