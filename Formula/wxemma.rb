class Wxemma < Formula
  desc "Run multiple WeChat instances on macOS"
  homepage "https://github.com/larrykoo711/wechat-emma"
  version "0.1.2"
  url "https://github.com/larrykoo711/wechat-emma/releases/download/v0.1.2/wxemma-macos-universal.tar.gz"
  sha256 "14970ef3b5803a931793ce7426abb800ced6ab53d9152c996899b34db3a2b08a"
  license "MIT"

  def install
    bin.install "wxemma"
  end

  test do
    assert_match "wxemma", shell_output("#{bin}/wxemma --version")
  end
end
