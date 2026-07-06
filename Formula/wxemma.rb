class Wxemma < Formula
  desc "Run multiple WeChat instances on macOS"
  homepage "https://github.com/larrykoo711/wechat-emma"
  version "0.1.5"
  url "https://github.com/larrykoo711/wechat-emma/releases/download/v0.1.5/wxemma-macos-universal.tar.gz"
  sha256 "5adf82a598b64c1271c6c58ea67be0fec38da188a467e154e103e35a42b37a17"
  license "MIT"

  def install
    bin.install "wxemma"
  end

  test do
    assert_match "wxemma", shell_output("#{bin}/wxemma --version")
  end
end
