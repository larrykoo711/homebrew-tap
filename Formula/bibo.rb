class Bibo < Formula
  desc "Fast, local neural text-to-speech CLI. Zero dependencies."
  homepage "https://larrykoo711.github.io/bibo"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/larrykoo711/bibo/releases/download/v#{version}/bibo-darwin-arm64.tar.gz"
      sha256 "6fa709543e1586107808a6b6005710415fb4ffd42ade189ac529fff00dd670ad"
    end
    on_intel do
      url "https://github.com/larrykoo711/bibo/releases/download/v#{version}/bibo-darwin-x64.tar.gz"
      sha256 "617eab766232abf04e7722af5a4b14ee782f38e0e1350d16b9894aa5c39b5b5b"
    end
  end

  def install
    bin.install "bibo"
  end

  def caveats
    <<~EOS
      Bibo uses sherpa-onnx for neural TTS (auto-downloads on first run).
      No Python or other dependencies required!

      Quick start:
        bibo "Hello, world!"                 # Speak (downloads default voice)
        bibo "你好世界" -v melo              # Chinese+English bilingual
        bibo -l                              # List installed voices
        bibo -d list                         # Show available voices
        bibo -d amy                          # Download a voice
        bibo "Hello" -o hello.wav            # Save to file
    EOS
  end

  test do
    assert_match "bibo", shell_output("#{bin}/bibo --version")
  end
end
