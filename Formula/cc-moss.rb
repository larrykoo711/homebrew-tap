class CcMoss < Formula
  desc "Recoverable Claude Code sessions in tmux"
  homepage "https://cc-moss.larrykoo.com"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.9/cc-moss-v0.3.9-aarch64-apple-darwin.tar.gz"
      sha256 "e2cab9e05e15eba1950742c6fdf49ca41d0c0dfdb59867042ed5dafb983620cd"
    end
    on_intel do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.9/cc-moss-v0.3.9-x86_64-apple-darwin.tar.gz"
      sha256 "084bb9aecf19937c162fc89588fd927c93916aed875d8dec9725ce91d5aea78c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.9/cc-moss-v0.3.9-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5f740c886dc2d9338445f3b467617172a86f7d45a55508a700666dd6bf010a9e"
    end
    on_intel do
      url "https://github.com/larrykoo711/cc-moss/releases/download/v0.3.9/cc-moss-v0.3.9-x86_64-unknown-linux-musl.tar.gz"
      sha256 "fe7490314beec2c1e00b4b9be412d9337eebb8cf277081dcb6d2f4d61558e745"
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
