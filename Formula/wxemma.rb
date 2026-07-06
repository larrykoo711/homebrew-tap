class Wxemma < Formula
  desc "Run multiple WeChat instances on macOS"
  homepage "https://github.com/larrykoo711/wechat-emma"
  version "0.1.4"
  url "https://github.com/larrykoo711/wechat-emma/releases/download/v0.1.4/wxemma-macos-universal.tar.gz"
  sha256 "9839fa43eb2fa84fb9abcc8ef00e9d72428fa903919001ef53693a332c39f20e"
  license "MIT"

  def install
    bin.install "wxemma"
  end

  test do
    assert_match "wxemma", shell_output("#{bin}/wxemma --version")
  end
end
