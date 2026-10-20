class CcMoss < Formula
  desc "Recoverable Claude Code sessions in tmux"
  homepage "https://cc-moss.larrykoo.com"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.1/cc-moss-v0.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "6a2c29588b168d03d6ca0db0caa4a1ebc308aa15a4e24f003b309fdf6916ded0"
    end
    on_intel do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.1/cc-moss-v0.3.1-x86_64-apple-darwin.tar.gz"
      sha256 "d9295f443a607aa10f9b618fa2fb6fad0dc1e967510e25341a428efc4153091a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.1/cc-moss-v0.3.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9ab54fe136d84c604bd35543d2cbc7a6145b900b21e2045416e16849d642d72b"
    end
    on_intel do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.1/cc-moss-v0.3.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "bfe8edda509a681fb2d55d10ed52c5ebfbc26aba5f7262182c6dde704100359d"
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
