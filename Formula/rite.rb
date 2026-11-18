class Rite < Formula
  desc "DSL and runtime for cryptographic key ceremonies"
  homepage "https://ritely.io"
  url "https://github.com/rite-ly/rite/releases/download/v0.9.0/rite-0.9.0-darwin-arm64.tar.gz"
  sha256 "9647d65314d88fd3e06b88e68a046484267d8c093dee9527b7e6e27ca01625d8"
  license "GPL-3.0-only"

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_intel do
      url "https://github.com/rite-ly/rite/releases/download/v0.9.0/rite-0.9.0-linux-amd64.tar.gz"
      sha256 "c7ed4e9d7a47043643a306ea506c9e9d0a51b76fc0d0334210366efdd8e6339d"
    end
    on_arm do
      url "https://github.com/rite-ly/rite/releases/download/v0.9.0/rite-0.9.0-linux-arm64.tar.gz"
      sha256 "f0f02bd48b3bf9d6391632a793f681353a8b4a939f9e135be600d4f284e64a98"
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
