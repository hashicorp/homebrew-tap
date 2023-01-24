class Sentinel < Formula
  desc ""
  homepage "https://docs.hashicorp.com/sentinel"
  version "0.19.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.19.1/sentinel_0.19.1_darwin_amd64.zip"
    sha256 "ce2bdade51782f415b055162f9fdc08ae697e5a195829ed89e17c5c72068672b"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/sentinel/0.19.1/sentinel_0.19.1_darwin_arm64.zip"
    sha256 "c5e93cbc424dcd665d0228f176436f9df4e0306a1ddf7ba082dabde53c394201"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.19.1/sentinel_0.19.1_linux_amd64.zip"
    sha256 "7f905d072b732266d39015a58326c30a217a0263ebfc5230bd39a54043ab8b04"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.19.1/sentinel_0.19.1_linux_arm.zip"
    sha256 "b309255e52f49de39291fc0102e9bd4cf4c8cc403b7aed2177c826751da42953"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.19.1/sentinel_0.19.1_linux_arm64.zip"
    sha256 "1a6e08795332323e1b41abff639c07882d71f8601aa53203ffdc4aaae5e8d01e"
  end

  conflicts_with "sentinel"

  def install
    bin.install "sentinel"
  end

  test do
    system "#{bin}/sentinel --version"
  end
end
