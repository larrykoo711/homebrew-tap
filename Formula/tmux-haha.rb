class TmuxHaha < Formula
  desc "Find, start and switch tmux sessions from one small command: ta"
  homepage "https://github.com/larrykoo711/tmux-haha"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/larrykoo711/tmux-haha/releases/download/v0.2.0/tmux-haha-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "a3966b07536bb99738c832b84221c47d29c63bbecf243ec34bcae767ff9e3b3f"
    end
    on_intel do
      url "https://github.com/larrykoo711/tmux-haha/releases/download/v0.2.0/tmux-haha-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "6793b4a37707ad65010b86548ca52d5a903a151b8ce65fc8db3963be762eba46"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/larrykoo711/tmux-haha/releases/download/v0.2.0/tmux-haha-v0.2.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "1ab5e9dd4befe450b80a4dabe52c07b7a2f5fbc99b94458183693fe86ee40d9c"
    end
    on_intel do
      url "https://github.com/larrykoo711/tmux-haha/releases/download/v0.2.0/tmux-haha-v0.2.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9f0126e15abed8c242fe4371e3268c767edd21271af35eefd88b77020ad5e59f"
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
