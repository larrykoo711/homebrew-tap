class CcMoss < Formula
  desc "Recoverable Claude Code sessions in tmux"
  homepage "https://cc-moss.larrykoo.com"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.12/cc-moss-v0.3.12-aarch64-apple-darwin.tar.gz"
      sha256 "6448f9136aa0326bcfe411f43f48c8dc8208174fc2fa094707526d5d731763e7"
    end
    on_intel do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.12/cc-moss-v0.3.12-x86_64-apple-darwin.tar.gz"
      sha256 "c832eeeb33e04a6856006d93d0c52cab32487e5cb6437bfaca61fb7d97ee960f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.12/cc-moss-v0.3.12-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c27b26f868235d5e17f0decf6ed2a67fbed6b66a445ca88d8305fdff07df0d94"
    end
    on_intel do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.12/cc-moss-v0.3.12-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c57372869f7d05cf6ef5a70652e20ff81113ded439a99ccc6fa039ea99bddd77"
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
