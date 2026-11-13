class CcMoss < Formula
  desc "Recoverable Claude Code sessions in tmux"
  homepage "https://cc-moss.larrykoo.com"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.11/cc-moss-v0.3.11-aarch64-apple-darwin.tar.gz"
      sha256 "75d5454d315e338361b5fc96a5eddf2cd81597a246dbff234e2041a6461ce6f6"
    end
    on_intel do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.11/cc-moss-v0.3.11-x86_64-apple-darwin.tar.gz"
      sha256 "84f3e9926ecab8c37f2680ea309047ef77e77c774966f023d202367017ba4cbb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.11/cc-moss-v0.3.11-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3d70e6438ffc73a0d052a5e83c36d3afd499abf967ce564a18c924fedf690c7c"
    end
    on_intel do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.11/cc-moss-v0.3.11-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b0b012d20a3f8c254af4c168ea566905c1d70db9c66f57749e5536f00147d535"
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
