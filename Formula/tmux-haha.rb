class TmuxHaha < Formula
  desc "Find, start and switch tmux sessions from one small command: ta"
  homepage "https://github.com/larrykoo711/tmux-haha"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/larrykoo711/tmux-haha/releases/download/v0.2.1/tmux-haha-v0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "3f1d180ea976d5038f9aa0ee9d89cf9c854fe29de727de0eb413146d472cf1aa"
    end
    on_intel do
      url "https://github.com/larrykoo711/tmux-haha/releases/download/v0.2.1/tmux-haha-v0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "a744ca2bdf8d602ddc7dcef62abb20ebcdd5246dd4e26ca33733d7ca1d145923"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/larrykoo711/tmux-haha/releases/download/v0.2.1/tmux-haha-v0.2.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "630191de4a6c589766c451f5921678372efe549706ecf4e66e606b2a210e1259"
    end
    on_intel do
      url "https://github.com/larrykoo711/tmux-haha/releases/download/v0.2.1/tmux-haha-v0.2.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3998cfc992f24d1da69404c0e74542378b31b4712eb3fb5391942d26e6384110"
    end
  end

  def install
    bin.install "ta"
  end

  def caveats
    <<~EOS
      Run `ta` to open the session picker, or `ta <name>` to go straight to a session.
      ta changes no global tmux settings; optional config: ~/.config/ta/config.toml
    EOS
  end

  test do
    assert_match "ta #{version}", shell_output("#{bin}/ta --version")
  end
end
