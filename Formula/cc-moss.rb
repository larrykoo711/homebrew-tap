class CcMoss < Formula
  desc "Recoverable Claude Code sessions in tmux"
  homepage "https://cc-moss.larrykoo.com"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.6/cc-moss-v0.3.6-aarch64-apple-darwin.tar.gz"
      sha256 "2e1a789c43aecdfc29f6217de66f30b014c322d9e3c872758dd2e7f417c22758"
    end
    on_intel do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.6/cc-moss-v0.3.6-x86_64-apple-darwin.tar.gz"
      sha256 "028e0a02928c0ad0711b3a0a7cea4d7b587d1138b845c5e57c5a391aa8ba95c9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.6/cc-moss-v0.3.6-aarch64-unknown-linux-musl.tar.gz"
      sha256 "903be8b314e3d01de1cf0698d0a225a15b32a6d6b0dc39dd10cdf7610206a7ae"
    end
    on_intel do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.6/cc-moss-v0.3.6-x86_64-unknown-linux-musl.tar.gz"
      sha256 "04b06e2aaa8a5906b0024eeb3945386d70e4aff33714670592c4317ba2cb6e86"
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
