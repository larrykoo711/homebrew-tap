class CcMoss < Formula
  desc "Recoverable Claude Code sessions in tmux"
  homepage "https://cc-moss.larrykoo.com"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.2.1/cc-moss-v0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "ccb795af5a5e978f7d805690fd4398fd2aa33905cfce61ad0cfc5fa37d20f45f"
    end
    on_intel do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.2.1/cc-moss-v0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "8b8ab95180459a80823084c13ff5496417bf2e032885def19751be4411a07b24"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.2.1/cc-moss-v0.2.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "aabd67a50c1c3773dd99c1feda4486738f86f82c916f493643b799a31880d738"
    end
    on_intel do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.2.1/cc-moss-v0.2.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "594ececfb805b26ae35e7a75641ef631499d8db16476c86038811c3f31d34c47"
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
