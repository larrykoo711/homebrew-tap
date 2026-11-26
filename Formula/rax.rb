class Rax < Formula
  desc "Standalone zero-dependency CLI for Rax cloud tenant onboarding and verification"
  homepage "https://github.com/larrykoo711/rax-cli"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/larrykoo711/rax-cli/releases/download/v0.3.0/rax-v0.3.0-darwin-arm64.tar.gz"
      sha256 "8d382b7f375823f8fe2b6165deb9bfdb81494a16f78e2820d9b531d7c245d2ee"
    else
      url "https://github.com/larrykoo711/rax-cli/releases/download/v0.3.0/rax-v0.3.0-darwin-amd64.tar.gz"
      sha256 "ed46d64f473d3e2e9f31b9c053de758e8aeab4c9c1ef10a31bf7693259a7ebf8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/larrykoo711/rax-cli/releases/download/v0.3.0/rax-v0.3.0-linux-arm64.tar.gz"
      sha256 "e710cd4eba607fcaad159629ef2e69fbf6a4ac9a4ed597a47ebf7a49b955031a"
    else
      url "https://github.com/larrykoo711/rax-cli/releases/download/v0.3.0/rax-v0.3.0-linux-amd64.tar.gz"
      sha256 "caa946234398bb64442e3a206dcd0634bb222f9d03266793340db84977760559"
    end
  end

  def install
    bin.install "rax"
  end

  test do
    assert_match "0.3.0", shell_output("#{bin}/rax --version")
  end
end
