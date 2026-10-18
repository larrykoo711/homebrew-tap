class CcMoss < Formula
  desc "Recoverable Claude Code sessions in tmux"
  homepage "https://cc-moss.larrykoo.com"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.2.2/cc-moss-v0.2.2-aarch64-apple-darwin.tar.gz"
      sha256 "bbc3c9416d693b510fcc424d806c37af17e2e3d80aef2f8872f0b11758bb34c0"
    end
    on_intel do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.2.2/cc-moss-v0.2.2-x86_64-apple-darwin.tar.gz"
      sha256 "38b19908f214667f8cea7bea331378c340f80e7aafe801e5fb87d7e1b007beac"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.2.2/cc-moss-v0.2.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "919d7392f35611012cd44f2bf857bcd34ab49797fec83259d1ef66c22f56cbce"
    end
    on_intel do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.2.2/cc-moss-v0.2.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9c5520481e37a420669e9f0d54d969717f0a4fbabef13c3d6e59f167f9e2e9fc"
    end
  end

  def install
    bin.install "cc-moss"
    # The menubar app, ad-hoc signed. `cc-moss install` copies it into
    # ~/Applications: macOS sends its notifications only from there.
    prefix.install "cc-moss.app" if OS.mac?
  end

  def caveats
    text = <<~EOS
      Set up the hooks, tmux and prompt (it shows every change and asks first):
        cc-moss install
        cc-moss doctor

      cc-moss runs Claude Code but does not install it.
      Before `brew uninstall cc-moss`, run `cc-moss install --uninstall`:
      it removes the hooks and every block it added, so Claude Code
      is not left calling a binary that is gone.
    EOS
    if OS.mac?
      text += <<~EOS

        The menubar app came along too: `cc-moss install` asks, then puts it
        in ~/Applications (macOS sends its notifications only from there), and
        `cc-moss update` keeps it on the same version as cc-moss.
      EOS
    end
    text
  end

  test do
    assert_match "cc-moss #{version}", shell_output("#{bin}/cc-moss --version")
    assert_path_exists prefix/"cc-moss.app/Contents/Info.plist" if OS.mac?
  end
end
