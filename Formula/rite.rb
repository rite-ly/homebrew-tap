class Rite < Formula
  desc "DSL and runtime for cryptographic key ceremonies"
  homepage "https://ritely.io"
  version "0.2.2"
  license "GPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/rite-ly/rite/releases/download/v0.2.2/rite-0.2.2-darwin-arm64.tar.gz"
      sha256 "46b997bd6abbd2e5dad5a8bf933e1dab4e7c5077d481fffbe32689d21091502c"
    end
    on_intel do
      url "https://github.com/rite-ly/rite/releases/download/v0.2.2/rite-0.2.2-darwin-amd64.tar.gz"
      sha256 "2f213e57824db2c04a24c13188774aa76f103386921cd69446f2cf47512e51b8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/rite-ly/rite/releases/download/v0.2.2/rite-0.2.2-linux-amd64.tar.gz"
      sha256 "3f4a5bf1c4cd1a3a753899c9c0863322a226440f9477efbb4891ab15722296d8"
    end
    on_arm do
      url "https://github.com/rite-ly/rite/releases/download/v0.2.2/rite-0.2.2-linux-arm64.tar.gz"
      sha256 "7a44bddf1ddbd33c3af17a7d64e0b20009d3f505c80f0630fa72f929a44037b9"
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
