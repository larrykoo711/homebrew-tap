class TmuxHaha < Formula
  desc "Find, start and switch tmux sessions from one small command: ta"
  homepage "https://github.com/larrykoo711/tmux-haha"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/larrykoo711/tmux-haha/releases/download/v0.1.0/tmux-haha-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "57537c518f9d74c6838a88d585bc4487be45516ee550d8760e2ca0c950c981e6"
    end
    on_intel do
      url "https://github.com/larrykoo711/tmux-haha/releases/download/v0.1.0/tmux-haha-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "774c9b0f172b947a2eac85fe4bb7483f5d5a0fe510cf1caee99717b37e0b1bae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/larrykoo711/tmux-haha/releases/download/v0.1.0/tmux-haha-v0.1.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "682816d4b83f5569da8c25b43003703aa5be632b28a0aa4b95fd0f0ce94709df"
    end
    on_intel do
      url "https://github.com/larrykoo711/tmux-haha/releases/download/v0.1.0/tmux-haha-v0.1.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "67f39dd50946147696c7a03170ff09c64ae01ded4edb7830e8296f90dba2710e"
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
