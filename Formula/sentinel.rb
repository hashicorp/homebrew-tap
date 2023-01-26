class Sentinel < Formula
  desc ""
  homepage "https://docs.hashicorp.com/sentinel"
  version "0.19.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.19.2/sentinel_0.19.2_darwin_amd64.zip"
    sha256 "b0c08e11a577314c7760101d84d5d41f7be56c583a19a926006cb0c4f6a200ca"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/sentinel/0.19.2/sentinel_0.19.2_darwin_arm64.zip"
    sha256 "c5da58ca218d86c530cfecf76691bd428e1f5e85dcaabb8ba7addaeecca338a1"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.19.2/sentinel_0.19.2_linux_amd64.zip"
    sha256 "f36c086f931ffab59ffb865de3a166846a05e287cae289dcc60cbaf3ff32c0cb"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.19.2/sentinel_0.19.2_linux_arm.zip"
    sha256 "f4c7ba3a0d58ef06e70db567e66a95d08bad2fb4262b01a55544881ef4cc30ee"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.19.2/sentinel_0.19.2_linux_arm64.zip"
    sha256 "3531a13ae837935cf18efa2d72556c5ba4648ead9a0a9698042358b8113328a9"
  end

  conflicts_with "sentinel"

  def install
    bin.install "sentinel"
  end

  test do
    system "#{bin}/sentinel --version"
  end
end
