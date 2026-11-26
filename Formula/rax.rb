class Rax < Formula
  desc "Standalone zero-dependency CLI for Rax cloud tenant onboarding and verification"
  homepage "https://github.com/larrykoo711/rax-cli"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/larrykoo711/rax-cli/releases/download/v0.5.0/rax-v0.5.0-darwin-arm64.tar.gz"
      sha256 "86a0a87b8a342cd194d7526483202d37b90b9963415a06b9f3cf0639fdd4a3c3"
    else
      url "https://github.com/larrykoo711/rax-cli/releases/download/v0.5.0/rax-v0.5.0-darwin-amd64.tar.gz"
      sha256 "7e87f8eebf8bc40f3c7bf6042c92d55cba94564d756988bd4c2c531493e6df1f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/larrykoo711/rax-cli/releases/download/v0.5.0/rax-v0.5.0-linux-arm64.tar.gz"
      sha256 "e10b68763f1b60d1bd6f7405e232862c5e052ffae990e76e927becf9642f8d64"
    else
      url "https://github.com/larrykoo711/rax-cli/releases/download/v0.5.0/rax-v0.5.0-linux-amd64.tar.gz"
      sha256 "60cc45045154f428e5f563ca33085ddb7b0eab7dacc8185616c06053de18cdf3"
    end
  end

  def install
    bin.install "rax"
  end

  test do
    assert_match "0.5.0", shell_output("#{bin}/rax --version")
  end
end
