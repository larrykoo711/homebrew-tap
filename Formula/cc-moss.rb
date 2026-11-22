class CcMoss < Formula
  desc "Recoverable Claude Code sessions in tmux"
  homepage "https://cc-moss.larrykoo.com"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.14/cc-moss-v0.3.14-aarch64-apple-darwin.tar.gz"
      sha256 "0613812ed4dc8d0bbc42349a2f3f04dab6c2f3ff2c32e6fd3cf7c0ba7cb9369b"
    end
    on_intel do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.14/cc-moss-v0.3.14-x86_64-apple-darwin.tar.gz"
      sha256 "0f51429ffca59480124d1430b77b7eb0cd8c00c9f885b47f455e92cf1ccfe1dd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.14/cc-moss-v0.3.14-aarch64-unknown-linux-musl.tar.gz"
      sha256 "60f6748eabe4de7e50f6dea5db02b41cabe6ce8cefa2874d9bbcd1a9627b44b9"
    end
    on_intel do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.14/cc-moss-v0.3.14-x86_64-unknown-linux-musl.tar.gz"
      sha256 "355edc41898791db4739c9eba10c733decab826cb801b20c6e10ea259eadee46"
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
