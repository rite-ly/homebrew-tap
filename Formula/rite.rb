class Rite < Formula
  desc "DSL and runtime for cryptographic key ceremonies"
  homepage "https://ritely.io"
  url "https://github.com/rite-ly/rite/releases/download/v0.7.0/rite-0.7.0-darwin-arm64.tar.gz"
  sha256 "a50a35c6375f741662cfc06e20829db909860c7242f97ac2a032a11687ac5361"
  license "GPL-3.0-only"

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_intel do
      url "https://github.com/rite-ly/rite/releases/download/v0.7.0/rite-0.7.0-linux-amd64.tar.gz"
      sha256 "e65d4c4fbefb48ad065afc7d02ed813a2c436a06fbe5906dc07860accf3baed3"
    end
    on_arm do
      url "https://github.com/rite-ly/rite/releases/download/v0.7.0/rite-0.7.0-linux-arm64.tar.gz"
      sha256 "f05280277697b563e765b89dc0e7d87ce09feee3cd8ad423919cb346c45b85b0"
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
