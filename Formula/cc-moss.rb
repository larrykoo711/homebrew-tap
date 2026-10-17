class CcMoss < Formula
  desc "Recoverable Claude Code sessions in tmux"
  homepage "https://github.com/larrykoo711/cc-moss"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.2.0/cc-moss-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "38930ce4e3b133ff5c5612e9f198f3aee3abe38e1b0058cd08ab53adbf752289"
    end
    on_intel do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.2.0/cc-moss-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "f05d83e388fdadd0369d33952c20d9364e2db4438b8d3af560df8b45606f323f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.2.0/cc-moss-v0.2.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "2217fe921c20e952a7a628d6501dcbd0370633b877b8ecda5ebf86fbc29178c5"
    end
    on_intel do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.2.0/cc-moss-v0.2.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "26a35d17f8917c004443f7ab8ed0eded6fdd43bdaa237d39248d7b7bdec41099"
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
