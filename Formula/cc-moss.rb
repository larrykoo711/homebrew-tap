class CcMoss < Formula
  desc "Recoverable Claude Code sessions in tmux"
  homepage "https://cc-moss.larrykoo.com"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.3/cc-moss-v0.3.3-aarch64-apple-darwin.tar.gz"
      sha256 "e452bd7fb1ef1f7f6aa22836371c8aaac04e368324fb497d62f9abd23b9cf96a"
    end
    on_intel do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.3/cc-moss-v0.3.3-x86_64-apple-darwin.tar.gz"
      sha256 "dc178cc85ca638ea186fd424c13eced8b460373713b5c27b72ee22febc99618b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.3/cc-moss-v0.3.3-aarch64-unknown-linux-musl.tar.gz"
      sha256 "421ff20ecc2c90bed8032903492d2678563c992b9ab8a2a6d2ad6d2fbca2b131"
    end
    on_intel do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.3/cc-moss-v0.3.3-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8a38a144fdf7abc1fe31390db7bf8509978a213bc1c46b5e1f61732117241a04"
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
