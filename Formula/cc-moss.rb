class CcMoss < Formula
  desc "Recoverable Claude Code sessions in tmux"
  homepage "https://cc-moss.larrykoo.com"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.0/cc-moss-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "483b85b7879f76acb618c83f43299bedbe2c36b2d15d37d5b1c98a329434f845"
    end
    on_intel do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.0/cc-moss-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "465c6586b7618c832533cb6ff13544a85cf8181f60de7045f2d8dbd627dd24da"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.0/cc-moss-v0.3.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f03dc566eaa1288ee201cedde6b65f6c45ed249863bec4d934701b5833590e44"
    end
    on_intel do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.0/cc-moss-v0.3.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "82cea086ab94e1a302d6af50a1b7b82dc5d468bdd9226e15c67c2f9d510c25ef"
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
