class Rite < Formula
  desc "DSL and runtime for cryptographic key ceremonies"
  homepage "https://ritely.io"
  version "0.1.0"
  license "GPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/rite-ly/rite/releases/download/v0.1.0/rite-0.1.0-darwin-arm64.tar.gz"
      sha256 "761309cbb8645b8a855e89a3cd4e89bf813cc963867d2c4d05965637f91e6f52"
    end
    on_intel do
      url "https://github.com/rite-ly/rite/releases/download/v0.1.0/rite-0.1.0-darwin-amd64.tar.gz"
      sha256 "4e009fd7924c62c1cbe81b6b9b35e0d00d578e9db43d470a27d7409ad6639648"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/rite-ly/rite/releases/download/v0.1.0/rite-0.1.0-linux-amd64.tar.gz"
      sha256 "01b7b8a43f2ba38c3b108e1066e6abdda20a2ded6f619491237b722be41bea53"
    end
    on_arm do
      url "https://github.com/rite-ly/rite/releases/download/v0.1.0/rite-0.1.0-linux-arm64.tar.gz"
      sha256 "ceb1c37737425c103b2a90fd1e1ddded93ca0589898a22d1044928a5139e1e08"
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
