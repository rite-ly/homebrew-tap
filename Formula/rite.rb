class Rite < Formula
  desc "DSL and runtime for cryptographic key ceremonies"
  homepage "https://ritely.io"
  url "https://github.com/rite-ly/rite/releases/download/v0.7.1/rite-0.7.1-darwin-arm64.tar.gz"
  sha256 "87c279ab99b013f40f43249baf272563fad381ee36c2549cd606dd6790969f5d"
  license "GPL-3.0-only"

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_intel do
      url "https://github.com/rite-ly/rite/releases/download/v0.7.1/rite-0.7.1-linux-amd64.tar.gz"
      sha256 "1b747ae1a3027a23e49645ddb2693646dc0bc95a9af24f35a89907a683462e40"
    end
    on_arm do
      url "https://github.com/rite-ly/rite/releases/download/v0.7.1/rite-0.7.1-linux-arm64.tar.gz"
      sha256 "de44c2d6ff3606894a161418b20327ca4fda65f1b4b788acce33d435c358bd2c"
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
