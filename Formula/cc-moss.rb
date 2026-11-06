class CcMoss < Formula
  desc "Recoverable Claude Code sessions in tmux"
  homepage "https://cc-moss.larrykoo.com"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.8/cc-moss-v0.3.8-aarch64-apple-darwin.tar.gz"
      sha256 "5c1dcdac4afdc359ee51fe24006933bfcb64a1f3927a66cc74336ee329017a54"
    end
    on_intel do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.8/cc-moss-v0.3.8-x86_64-apple-darwin.tar.gz"
      sha256 "60280acb208a2999bb6968def2be5cdd7345cb59c510c81f794dd5226b7ae320"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.8/cc-moss-v0.3.8-aarch64-unknown-linux-musl.tar.gz"
      sha256 "28ae41d847fca5d3cc0365355262b433d00d3383e6da55fdaf7618c09054e5f2"
    end
    on_intel do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.8/cc-moss-v0.3.8-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ee43e74bf7116d7b073e43a78180de9ab6fcde5168a5872c63a2f8dcf0983e02"
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
