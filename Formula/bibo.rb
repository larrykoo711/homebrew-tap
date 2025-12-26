class Bibo < Formula
  desc "Fast, local neural text-to-speech CLI. Zero dependencies."
  homepage "https://larrykoo711.github.io/bibo"
  version "0.3.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/larrykoo711/bibo/releases/download/v#{version}/bibo-darwin-arm64.tar.gz"
      sha256 "778460c2aa49b09b2a8141d89339c2ff480f9779a08afe2dc0f76862e6bc1a6e"
    end
    on_intel do
      url "https://github.com/larrykoo711/bibo/releases/download/v#{version}/bibo-darwin-x64.tar.gz"
      sha256 "01e5430fbd2411b2846ad4640ae4c2b58417ef02d54826cfa7d4b1744bacbbd9"
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

      Uninstall completely:
        bibo --clean && brew uninstall bibo
    EOS
  end

  test do
    assert_match "bibo", shell_output("#{bin}/bibo --version")
  end
end
