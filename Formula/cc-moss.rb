class CcMoss < Formula
  desc "Recoverable Claude Code sessions in tmux"
  homepage "https://cc-moss.larrykoo.com"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.10/cc-moss-v0.3.10-aarch64-apple-darwin.tar.gz"
      sha256 "198330f8c0d6b3c8d969931894724123dcf49a51c2b6a123a144f8e1871c2252"
    end
    on_intel do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.10/cc-moss-v0.3.10-x86_64-apple-darwin.tar.gz"
      sha256 "356db66d3077b17c8938594dfcc82780407168b0611ba9275ce1ecf73c6bb8de"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.10/cc-moss-v0.3.10-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0e37a14283a417e589b6e0a453272f549f777b93a64a5d3a08efd4bc3ad32cc3"
    end
    on_intel do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.10/cc-moss-v0.3.10-x86_64-unknown-linux-musl.tar.gz"
      sha256 "81df5b2b326aeef2c54613341ab2013aa16bfda85250c29481d2c7a70e89f778"
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
