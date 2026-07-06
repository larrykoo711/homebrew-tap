class Wxemma < Formula
  desc "Run multiple WeChat instances on macOS"
  homepage "https://github.com/larrykoo711/wechat-emma"
  version "0.1.0"
  url "https://github.com/larrykoo711/wechat-emma/releases/download/v0.1.0/wxemma-macos-universal.tar.gz"
  sha256 "adde649157d46d4775239e8208afd6c4d263d99f0bff71d98d5b675d052b8d67"
  license "MIT"

  def install
    bin.install "wxemma"
  end

  test do
    assert_match "wxemma", shell_output("#{bin}/wxemma --version")
  end
end
