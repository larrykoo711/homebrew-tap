class CcMoss < Formula
  desc "Recoverable Claude Code sessions in tmux"
  homepage "https://cc-moss.larrykoo.com"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.15/cc-moss-v0.3.15-aarch64-apple-darwin.tar.gz"
      sha256 "636623ff405d5780bf56081c09778f4ae23fc8b86bb8d31519930146b7f9dcf3"
    end
    on_intel do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.15/cc-moss-v0.3.15-x86_64-apple-darwin.tar.gz"
      sha256 "8a9988b7185671ccceaccf53537dc51ed13ae93935cc9c9ab816c54f7485b250"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.15/cc-moss-v0.3.15-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ee47945f9e26a9a52f79ab02493f13f0ae30f8f6dd60bf0e518cf1124174bbd0"
    end
    on_intel do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.15/cc-moss-v0.3.15-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c8794a7cb0031d8ed44d8608835ff31cd67c74df9736c70b011c93774d81b439"
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
