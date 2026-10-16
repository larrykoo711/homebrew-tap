class CcMoss < Formula
  desc "Recoverable Claude Code sessions in tmux"
  homepage "https://github.com/larrykoo711/cc-moss"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.1.1/cc-moss-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "c4f49fa053bc25a53a1d242b601b8c1b4ff14d8d04469705fc00d8900e8a8235"
    end
    on_intel do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.1.1/cc-moss-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "66c922e02ae73552c787075d2bc2d6783396d8878d39233c866f33210ff2a59a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.1.1/cc-moss-v0.1.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9d21ef40505896ee57f0a1d1deb28a88ae820699293afa584468c6a354e624e5"
    end
    on_intel do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.1.1/cc-moss-v0.1.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4a6cf91cd95765c9e4e5466fe3e64ca954b2386552c7374b97dd2fa1536bad99"
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
