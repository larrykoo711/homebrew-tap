class CcMoss < Formula
  desc "Recoverable Claude Code sessions in tmux"
  homepage "https://cc-moss.larrykoo.com"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.7/cc-moss-v0.3.7-aarch64-apple-darwin.tar.gz"
      sha256 "bd986516a1377a2682cfb1423efb3dd7b586939da4808bcbd3095a0db044e5da"
    end
    on_intel do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.7/cc-moss-v0.3.7-x86_64-apple-darwin.tar.gz"
      sha256 "64937116da0a0a29203acab8eb0abc306044917a47e8d669cb87bfca6a1797fb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.7/cc-moss-v0.3.7-aarch64-unknown-linux-musl.tar.gz"
      sha256 "52caa61750cfd5f574f179442f9434866faf4339075a3ca40cc72794f48e64ab"
    end
    on_intel do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.7/cc-moss-v0.3.7-x86_64-unknown-linux-musl.tar.gz"
      sha256 "da5c57445038ee9cea1ec100e4a2f66a61e4d2f9c2cad4573bb14c41334c6ec9"
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
