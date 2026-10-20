class CcMoss < Formula
  desc "Recoverable Claude Code sessions in tmux"
  homepage "https://cc-moss.larrykoo.com"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.2/cc-moss-v0.3.2-aarch64-apple-darwin.tar.gz"
      sha256 "0fc952c585cd954fb3cc1bb6703721e836343e600eeed8c06340b2cc32524f55"
    end
    on_intel do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.2/cc-moss-v0.3.2-x86_64-apple-darwin.tar.gz"
      sha256 "11b70cfbce92087ec4ba55ac433f896ee799d3ef261df0ad6d00caf67f56e0a3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.2/cc-moss-v0.3.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4d7692c54f92acac5e27cef514c5af2646482f263a5485bb37baca7292acf41f"
    end
    on_intel do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.2/cc-moss-v0.3.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c498e3fb3b7c353834464a0276392519f47255b99a79f8d5431b2ebfa81f203c"
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
