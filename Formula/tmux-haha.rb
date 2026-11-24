class TmuxHaha < Formula
  desc "Find, start and switch tmux sessions from one small command: ta"
  homepage "https://github.com/larrykoo711/tmux-haha"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/larrykoo711/tmux-haha/releases/download/v0.3.0/tmux-haha-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "be7929efdefe0f3f3da0a038d3af4647b34f8b920c16b32fd62349e502bb44ce"
    end
    on_intel do
      url "https://github.com/larrykoo711/tmux-haha/releases/download/v0.3.0/tmux-haha-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "995ce594db8c3149ccb351c1b8e09f9848300e5ae0b24f54aa2fdb654996650f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/larrykoo711/tmux-haha/releases/download/v0.3.0/tmux-haha-v0.3.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d1e452b534f433ad4ca72b80d0f9f7e52459eff2a841642f2d7663b9398b3333"
    end
    on_intel do
      url "https://github.com/larrykoo711/tmux-haha/releases/download/v0.3.0/tmux-haha-v0.3.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6f89d8e5b74775e4f53d03561eaba59b51a915486a94121d63b0aa23ee95092c"
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
