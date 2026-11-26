class Rax < Formula
  desc "Standalone zero-dependency CLI for Rax cloud tenant onboarding and verification"
  homepage "https://github.com/larrykoo711/rax-cli"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/larrykoo711/rax-cli/releases/download/v0.2.0/rax-v0.2.0-darwin-arm64.tar.gz"
      sha256 "dcfc22bd1d0ea7792347b4fbe83ba8a31b7a996c6f5d9464690099ddce891778"
    else
      url "https://github.com/larrykoo711/rax-cli/releases/download/v0.2.0/rax-v0.2.0-darwin-amd64.tar.gz"
      sha256 "144345cddbc7739d8153f1b8c4f06ccbb305de358e4042197809c58d718a46ec"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/larrykoo711/rax-cli/releases/download/v0.2.0/rax-v0.2.0-linux-arm64.tar.gz"
      sha256 "2f40f176ed6f3f9835ccea5e82fe1b41acfe18ff87df2da4a62e01599d0ed0f6"
    else
      url "https://github.com/larrykoo711/rax-cli/releases/download/v0.2.0/rax-v0.2.0-linux-amd64.tar.gz"
      sha256 "bdfc4a70b41c40ce746afeb7008d68afc1b058728036a76c8684cfe2b64d6308"
    end
  end

  def install
    bin.install "rax"
  end

  test do
    assert_match "0.2.0", shell_output("#{bin}/rax --version")
  end
end
