class CcMoss < Formula
  desc "Recoverable Claude Code sessions in tmux"
  homepage "https://cc-moss.larrykoo.com"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.5/cc-moss-v0.3.5-aarch64-apple-darwin.tar.gz"
      sha256 "a5ecf37fc27df320dbb198a5f70520453492944c84e95dd3c4026c506fcf149b"
    end
    on_intel do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.5/cc-moss-v0.3.5-x86_64-apple-darwin.tar.gz"
      sha256 "f0ae23021321fb0915f6fda3152e74d984630137fbd136e57829ca98d518f455"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.5/cc-moss-v0.3.5-aarch64-unknown-linux-musl.tar.gz"
      sha256 "1727d0337648dc102a3beb26f86f003ca522d6b7ab8512a66d1e21164a13c17c"
    end
    on_intel do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.5/cc-moss-v0.3.5-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4974a706722e0a1bbea18bd28b22ca5fe1d001f8afcd090f7141c11045e08aa0"
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
