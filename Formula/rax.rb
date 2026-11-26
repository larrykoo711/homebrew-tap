class Rax < Formula
  desc "Zero-dependency CLI for Rax Cloud Channel Control Tower"
  homepage "https://github.com/larrykoo711/rax-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/larrykoo711/rax-cli/releases/download/v0.1.0/rax-v0.1.0-darwin-arm64.tar.gz"
      sha256 "c6ce6250140d04b9e3698ba8f746eaaab8690f33bb0cac4979be96433eb3a671"
    end
    on_intel do
      url "https://github.com/larrykoo711/rax-cli/releases/download/v0.1.0/rax-v0.1.0-darwin-amd64.tar.gz"
      sha256 "092531e8c36ef3aed8d74d04210862d92d8fd961ddbf16a4471688dc8f4a0696"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/larrykoo711/rax-cli/releases/download/v0.1.0/rax-v0.1.0-linux-arm64.tar.gz"
      sha256 "9414420e02d1199856550a93866e77cf3d3d9ffa2847573f995d3fa3aff40a31"
    end
    on_intel do
      url "https://github.com/larrykoo711/rax-cli/releases/download/v0.1.0/rax-v0.1.0-linux-amd64.tar.gz"
      sha256 "669daa7f2c37391ddfb96b808786347a57479728cea050e6f23865b491c78064"
    end
  end

  def install
    bin.install "rax"
  end

  def caveats
    <<~EOS
      Onboard an Azure tenant via native Device Code (no Python or az CLI needed):
        rax azure onboard --slug <name> --apply

      Verify a generated bundle:
        rax azure verify --bundle ./rax-onboard-bundle.json
    EOS
  end

  test do
    assert_match "rax #{version}", shell_output("#{bin}/rax --version")
  end
end
