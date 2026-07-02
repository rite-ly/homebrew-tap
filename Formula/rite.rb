class Rite < Formula
  desc "DSL and runtime for cryptographic key ceremonies"
  homepage "https://ritely.io"
  version "0.3.1"
  license "GPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/rite-ly/rite/releases/download/v0.3.1/rite-0.3.1-darwin-arm64.tar.gz"
      sha256 "65f2498364205828014ecda6a6518ad6bb0cad7e6924bf45b6801ddc67eb20f6"
    end
    on_intel do
      url "https://github.com/rite-ly/rite/releases/download/v0.3.1/rite-0.3.1-darwin-amd64.tar.gz"
      sha256 "6d102dadc33ffe0e0b1706861ade9637d6d6a5252f9a23d7728d6c1bea166a9e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/rite-ly/rite/releases/download/v0.3.1/rite-0.3.1-linux-amd64.tar.gz"
      sha256 "2c49ccebda1c5f2c312879f18fe3afdc49bb97cf38f07ab50120eb923c4cdb46"
    end
    on_arm do
      url "https://github.com/rite-ly/rite/releases/download/v0.3.1/rite-0.3.1-linux-arm64.tar.gz"
      sha256 "4f57cc496b203378ffe249185ff52f6d3b3ff8ec4276b2e6eff7764e61639914"
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
