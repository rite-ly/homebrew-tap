class Rite < Formula
  desc "DSL and runtime for cryptographic key ceremonies"
  homepage "https://ritely.io"
  license "GPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/rite-ly/rite/releases/download/v0.1.0-rc.4/rite-0.1.0-rc.4-darwin-arm64.tar.gz"
      sha256 "ab611b69b62e9590227c2f58eb75b4c63fd8cb7a4d877376f8574557fb4838a4"
    end
    on_intel do
      url "https://github.com/rite-ly/rite/releases/download/v0.1.0-rc.4/rite-0.1.0-rc.4-darwin-amd64.tar.gz"
      sha256 "6702bfc6e5eb92877bc065a7c4c0af31bfe0b3260504892288c0226a18bb71b4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/rite-ly/rite/releases/download/v0.1.0-rc.4/rite-0.1.0-rc.4-linux-amd64.tar.gz"
      sha256 "0ca43a52b26b9fc927f2476d102f8a19053632133032a9299bab87bd7ae3c058"
    end
    on_arm do
      url "https://github.com/rite-ly/rite/releases/download/v0.1.0-rc.4/rite-0.1.0-rc.4-linux-arm64.tar.gz"
      sha256 "ac44e8059fbb4b950139b5fa284925f17aea969f845ec2403bcbd1bdf03e6d95"
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
