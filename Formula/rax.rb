class Rax < Formula
  desc "Standalone zero-dependency CLI for Rax cloud tenant onboarding and verification"
  homepage "https://github.com/larrykoo711/rax-cli"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/larrykoo711/rax-cli/releases/download/v0.4.0/rax-v0.4.0-darwin-arm64.tar.gz"
      sha256 "15a96e82e8c2c4c29cde5d78ef3954c54443dbb51096a9210d3d8d3d1ddbb29b"
    else
      url "https://github.com/larrykoo711/rax-cli/releases/download/v0.4.0/rax-v0.4.0-darwin-amd64.tar.gz"
      sha256 "d1d41907469ab6da12a2f266cf8c2e594a21e8ed60b2f3c131627029f555a0e0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/larrykoo711/rax-cli/releases/download/v0.4.0/rax-v0.4.0-linux-arm64.tar.gz"
      sha256 "696fc18ea7553e91ce2262a2cd54a824f8feb9c7d7f1e743b132e6c0322ad2db"
    else
      url "https://github.com/larrykoo711/rax-cli/releases/download/v0.4.0/rax-v0.4.0-linux-amd64.tar.gz"
      sha256 "bf7c2a09da20bb08aad5ac46fd18a2ff13159c3dc3d4c690d632413faf748d2c"
    end
  end

  def install
    bin.install "rax"
  end

  test do
    assert_match "0.4.0", shell_output("#{bin}/rax --version")
  end
end
