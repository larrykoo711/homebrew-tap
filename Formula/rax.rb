class Rax < Formula
  desc "Standalone CLI for Rax cloud onboarding and operations (zero Python/az CLI dependencies)"
  homepage "https://github.com/larrykoo711/rax-cli"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/larrykoo711/rax-cli/releases/download/v0.6.0/rax-v0.6.0-darwin-arm64.tar.gz"
      sha256 "b71b24f58d053da322a11335fdc5b3f3d8c12e647289032ecacb437f620747a7"
    else
      url "https://github.com/larrykoo711/rax-cli/releases/download/v0.6.0/rax-v0.6.0-darwin-amd64.tar.gz"
      sha256 "9272e5e308887074b8e5b6e8060faad3e8dcc10eca2d6f5cf15971b587c61004"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/larrykoo711/rax-cli/releases/download/v0.6.0/rax-v0.6.0-linux-arm64.tar.gz"
      sha256 "67e4f880b72a75965cbda980d43f25cceb00b4fbe86fa5cff6351944d8e4c5d4"
    else
      url "https://github.com/larrykoo711/rax-cli/releases/download/v0.6.0/rax-v0.6.0-linux-amd64.tar.gz"
      sha256 "784bc013a31f1ccb24fb5eabbcf6f1c7fe9ca7a11b31bd13b8cf763d195c784a"
    end
  end

  def install
    bin.install "rax"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rax --version")
  end
end
