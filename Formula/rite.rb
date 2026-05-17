class Rite < Formula
  desc "DSL and runtime for cryptographic key ceremonies"
  homepage "https://ritely.io"
  version "0.1.1"
  license "GPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/rite-ly/rite/releases/download/v0.1.1/rite-0.1.1-darwin-arm64.tar.gz"
      sha256 "f49fd4236cfe029461d7863e72f94dce8426213e5d1bf9f7975038337f245ad4"
    end
    on_intel do
      url "https://github.com/rite-ly/rite/releases/download/v0.1.1/rite-0.1.1-darwin-amd64.tar.gz"
      sha256 "1df331bdbf5387738769c70d13de02b86888230d10e3e7d7baa2fa7bf8c55911"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/rite-ly/rite/releases/download/v0.1.1/rite-0.1.1-linux-amd64.tar.gz"
      sha256 "9f359495c45e6e37190e4981595200bff911f15d2ebb7083814e9688e0e34ac5"
    end
    on_arm do
      url "https://github.com/rite-ly/rite/releases/download/v0.1.1/rite-0.1.1-linux-arm64.tar.gz"
      sha256 "bbbe20c226c61b6b5c4a6affbcedfc5b6741f8b2bbd9410ef2f4a0830b75efec"
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
