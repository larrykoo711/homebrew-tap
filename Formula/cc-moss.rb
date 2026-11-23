class CcMoss < Formula
  desc "Recoverable Claude Code sessions in tmux"
  homepage "https://cc-moss.larrykoo.com"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.16/cc-moss-v0.3.16-aarch64-apple-darwin.tar.gz"
      sha256 "ef069cc6a30829d88bdb0fcfb6d0b36544253431c4e9fa171a8e2223652db521"
    end
    on_intel do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.16/cc-moss-v0.3.16-x86_64-apple-darwin.tar.gz"
      sha256 "566328f97a449caf14c9db969aa601dfb860430ef715780f029295ab5d98866a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.16/cc-moss-v0.3.16-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0d8e0ac377434faac7bc65f29bc978728eb615a95541fd0ca3c45fbc46436648"
    end
    on_intel do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.16/cc-moss-v0.3.16-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d984bd3b58f50a1c58ec72b364b7380940bb6f95e86f4514be8ca0687566351e"
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
