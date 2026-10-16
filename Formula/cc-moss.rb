class CcMoss < Formula
  desc "Recoverable Claude Code sessions in tmux"
  homepage "https://github.com/larrykoo711/cc-moss"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.1.0/cc-moss-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "0b7394ec76a00d079cfa132ddb696a3fd8f439a4048562089d0e1f2932f3e312"
    end
    on_intel do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.1.0/cc-moss-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "42d94323a25f3239a6ee2ad97933633d59dce2c47d533f6a700f382111118dbd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.1.0/cc-moss-v0.1.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0871b1649f4cec9409ac7e4107a69e1d32ebe06b75a8fe7bb7a34edf1460b79b"
    end
    on_intel do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.1.0/cc-moss-v0.1.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "94580dc5ad3b1be402e7a25a8e4bb927ca09f20b082eb26e49e7b0f6a277b499"
    end
  end

  def install
    bin.install "cc-moss"
  end

  def caveats
    <<~EOS
      Set up the hooks, tmux and prompt (it shows every change and asks first):
        cc-moss install
        cc-moss doctor

      cc-moss runs Claude Code but does not install it.
      Before `brew uninstall cc-moss`, run `cc-moss install --uninstall`:
      it removes the hooks and every block it added, so Claude Code
      is not left calling a binary that is gone.
    EOS
  end

  test do
    assert_match "cc-moss #{version}", shell_output("#{bin}/cc-moss --version")
  end
end
