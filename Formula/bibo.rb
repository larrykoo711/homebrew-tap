class Bibo < Formula
  desc "Fast, local neural text-to-speech CLI"
  homepage "https://larrykoo711.github.io/bibo"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/larrykoo711/bibo/releases/download/v#{version}/bibo-darwin-arm64.tar.gz"
      sha256 "PLACEHOLDER_SHA256_ARM64"
    end
    on_intel do
      url "https://github.com/larrykoo711/bibo/releases/download/v#{version}/bibo-darwin-x64.tar.gz"
      sha256 "PLACEHOLDER_SHA256_X64"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/larrykoo711/bibo/releases/download/v#{version}/bibo-linux-x64.tar.gz"
      sha256 "PLACEHOLDER_SHA256_LINUX"
    end
  end

  depends_on "python@3.13"

  def install
    bin.install "bibo"
  end

  def post_install
    ohai "Installing Python dependencies..."
    system "pip3", "install", "--user", "piper-tts"
  end

  def caveats
    <<~EOS
      Bibo requires Python piper-tts for TTS synthesis.
      If not installed automatically, run:
        pip3 install piper-tts

      Quick start:
        bibo "Hello, world!"                 # Speak text
        bibo -l                              # List available voices
        bibo -d amy                          # Download a voice
        bibo "Hello" -v amy -o hello.wav     # Save to file
    EOS
  end

  test do
    assert_match "bibo", shell_output("#{bin}/bibo --version")
  end
end
