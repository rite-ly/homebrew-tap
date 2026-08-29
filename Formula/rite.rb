class Rite < Formula
  desc "DSL and runtime for cryptographic key ceremonies"
  homepage "https://ritely.io"
  license "GPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/rite-ly/rite/releases/download/v0.5.0/rite-0.5.0-darwin-arm64.tar.gz"
      sha256 "a7664ec3f76c7f5928cc7b0129022ebb08b8669957d0d69be511d49573d40f0f"
    end
    on_intel do
      url "https://github.com/rite-ly/rite/releases/download/v0.5.0/rite-0.5.0-darwin-amd64.tar.gz"
      sha256 "a46230c4fa18d1c54f2e3d03f67c5ecc190d24fda38c119abd4c1eaea1f010fe"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/rite-ly/rite/releases/download/v0.5.0/rite-0.5.0-linux-amd64.tar.gz"
      sha256 "b92afc5a63615cad827057b66b177233e695746770242b4bbdaea9add8925615"
    end
    on_arm do
      url "https://github.com/rite-ly/rite/releases/download/v0.5.0/rite-0.5.0-linux-arm64.tar.gz"
      sha256 "cdab0e78149232aebd2aff4df4d578242b97449054ee60cf7f73064e51d6432f"
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
