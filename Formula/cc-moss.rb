class CcMoss < Formula
  desc "Recoverable Claude Code sessions in tmux"
  homepage "https://cc-moss.larrykoo.com"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.13/cc-moss-v0.3.13-aarch64-apple-darwin.tar.gz"
      sha256 "f028c8389d371f7f7c6d225ba8e2d455756b3caa5b46bd572368d850ad69329a"
    end
    on_intel do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.13/cc-moss-v0.3.13-x86_64-apple-darwin.tar.gz"
      sha256 "4faf63e63d8f6769ac91f2bab94e978fb44a78f52d9985f6438eec7c27153f75"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.13/cc-moss-v0.3.13-aarch64-unknown-linux-musl.tar.gz"
      sha256 "611f9c4e5f48c841993e41a16bc63c74cbdbf0b20172b8e6af370a6acb327895"
    end
    on_intel do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.13/cc-moss-v0.3.13-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9f6b2512dd1db97277f494f3f584b0f8fca2190839020c5b19d24b86fae161cf"
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
