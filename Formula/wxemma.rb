class Wxemma < Formula
  desc "Run multiple WeChat instances on macOS"
  homepage "https://github.com/larrykoo711/wechat-emma"
  version "0.1.1"
  url "https://github.com/larrykoo711/wechat-emma/releases/download/v0.1.1/wxemma-macos-universal.tar.gz"
  sha256 "a6907b9f69fef9f7473671333d1d4508df8a93ad06787ab7cef171c71a1f7556"
  license "MIT"

  def install
    bin.install "wxemma"
  end

  test do
    assert_match "wxemma", shell_output("#{bin}/wxemma --version")
  end
end
