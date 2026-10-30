class Rite < Formula
  desc "DSL and runtime for cryptographic key ceremonies"
  homepage "https://ritely.io"
  url "https://github.com/rite-ly/rite/releases/download/v0.8.0/rite-0.8.0-darwin-arm64.tar.gz"
  sha256 "4ab75813d83fcd1d50ffd73929525f4fa91a2c006cf75c5547385ba9b8f63f5e"
  license "GPL-3.0-only"

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_intel do
      url "https://github.com/rite-ly/rite/releases/download/v0.8.0/rite-0.8.0-linux-amd64.tar.gz"
      sha256 "082105db3afbbcec6e15dc2fcfe4c9283513f1b4e588c3bbac437c9f499046c8"
    end
    on_arm do
      url "https://github.com/rite-ly/rite/releases/download/v0.8.0/rite-0.8.0-linux-arm64.tar.gz"
      sha256 "2db23e33c0b1f1463ea6b53dd4984820f3b4066b3fc39dc39187f6d872183357"
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
