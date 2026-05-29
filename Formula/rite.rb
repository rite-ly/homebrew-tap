class Rite < Formula
  desc "DSL and runtime for cryptographic key ceremonies"
  homepage "https://ritely.io"
  version "0.2.1"
  license "GPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/rite-ly/rite/releases/download/v0.2.1/rite-0.2.1-darwin-arm64.tar.gz"
      sha256 "c4e6157b8e7d94a999abaed2cff9224a3957d2ed3aca888b2124799fd258663a"
    end
    on_intel do
      url "https://github.com/rite-ly/rite/releases/download/v0.2.1/rite-0.2.1-darwin-amd64.tar.gz"
      sha256 "95a78746dc4be4de786362838415f4689c10503378bde7a26aeff63be4486f6b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/rite-ly/rite/releases/download/v0.2.1/rite-0.2.1-linux-amd64.tar.gz"
      sha256 "a272c13927f243dd5fd18a960facf8dfd739bcc03a5bdba238a391978f5b6346"
    end
    on_arm do
      url "https://github.com/rite-ly/rite/releases/download/v0.2.1/rite-0.2.1-linux-arm64.tar.gz"
      sha256 "494f4a7d338a8c3e8863c7ef0d163f690ba82552a6f166785643638ca17a6aff"
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
