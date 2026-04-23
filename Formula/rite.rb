class Rite < Formula
  desc "DSL and runtime for cryptographic key ceremonies"
  homepage "https://ritely.io"
  license "GPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/rite-ly/rite/releases/download/v0.1.0-rc.3/rite-0.1.0-rc.3-darwin-arm64.tar.gz"
      sha256 "f269dfd4b4de1ed56b6e799269e78a413d73677462fce896538e1e55026800d3"
    end
    on_intel do
      url "https://github.com/rite-ly/rite/releases/download/v0.1.0-rc.3/rite-0.1.0-rc.3-darwin-amd64.tar.gz"
      sha256 "836d73a022084778b9dd65b146ab9303fa808f3e5fa195eea7dbbbefa7f9fc76"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/rite-ly/rite/releases/download/v0.1.0-rc.3/rite-0.1.0-rc.3-linux-amd64.tar.gz"
      sha256 "33f324a6342aaf41fc6fa12c8cf3ae91a121b25bfe31ccb76d6731a565da8dbc"
    end
    on_arm do
      url "https://github.com/rite-ly/rite/releases/download/v0.1.0-rc.3/rite-0.1.0-rc.3-linux-arm64.tar.gz"
      sha256 "54608827071caba8be90a56cdd9c3b7dd2b35245df66fbdad058c6c8e7fe12b2"
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
