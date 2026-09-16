class Rite < Formula
  desc "DSL and runtime for cryptographic key ceremonies"
  homepage "https://ritely.io"
  license "GPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/rite-ly/rite/releases/download/v0.6.0/rite-0.6.0-darwin-arm64.tar.gz"
      sha256 "5249d0b509e89b65060504f3a9abcb6dd7872667ced196f455b7d650d409a451"
    end
    on_intel do
      url "https://github.com/rite-ly/rite/releases/download/v0.6.0/rite-0.6.0-darwin-amd64.tar.gz"
      sha256 "92b4742b21bfa9aa990f984b6347708584c740aa09700b8ddd26a192997977f0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/rite-ly/rite/releases/download/v0.6.0/rite-0.6.0-linux-amd64.tar.gz"
      sha256 "e3e6aebfd67ec2a6f04f5d96d277d14d72679e6aa4295a3a52bb36cf20d28372"
    end
    on_arm do
      url "https://github.com/rite-ly/rite/releases/download/v0.6.0/rite-0.6.0-linux-arm64.tar.gz"
      sha256 "6e6f4633b1f935d86f134acf22d282e068fe0ca2871caba9268eab932319185a"
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
