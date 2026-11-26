class Rax < Formula
  desc "Standalone CLI for Rax cloud onboarding and operations (zero Python/az CLI dependencies)"
  homepage "https://github.com/larrykoo711/rax-cli"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/larrykoo711/rax-cli/releases/download/v0.7.0/rax-v0.7.0-darwin-arm64.tar.gz"
      sha256 "9a564708a88125a05a46581a001826d81b9772d184786ea2d3f37f4949b66f3e"
    else
      url "https://github.com/larrykoo711/rax-cli/releases/download/v0.7.0/rax-v0.7.0-darwin-amd64.tar.gz"
      sha256 "b79c4e93dc6f14a08bf213d218ebe46cbf219aaf283b9bbdc09591f4c5c9f1a8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/larrykoo711/rax-cli/releases/download/v0.7.0/rax-v0.7.0-linux-arm64.tar.gz"
      sha256 "749271b30593381aed7948d6904c2f49871d47045103ca2da3bfa090bd17e388"
    else
      url "https://github.com/larrykoo711/rax-cli/releases/download/v0.7.0/rax-v0.7.0-linux-amd64.tar.gz"
      sha256 "1224710dfb527dc20fd5cd82e694eec8f48ed816d298c9b7d1541a50da8042ac"
    end
  end

  def install
    bin.install "rax"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rax --version")
  end
end
