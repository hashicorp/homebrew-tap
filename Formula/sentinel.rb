class Sentinel < Formula
  desc ""
  homepage "https://docs.hashicorp.com/sentinel"
  version "0.20.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.20.0/sentinel_0.20.0_darwin_amd64.zip"
    sha256 "037f778b3533d9c7405ac92388bbe1a44fab3ca9236b995a473bc75529ad35a0"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/sentinel/0.20.0/sentinel_0.20.0_darwin_arm64.zip"
    sha256 "c9f9a6d679977520eca2fa49e507d91991f7e8c837a4ee34331a707e3726b1ad"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.20.0/sentinel_0.20.0_linux_amd64.zip"
    sha256 "65f365340014479fb08207dae35e19347a783564e01556502f2010089acb50d6"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.20.0/sentinel_0.20.0_linux_arm.zip"
    sha256 "b31141c1b06c3fb830c3ad7c922a4aa2c6ae71024dab257c64782dff678602a6"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.20.0/sentinel_0.20.0_linux_arm64.zip"
    sha256 "0f793cdd52150ebf842ffb6722743564d4448c09175443cc8090a655a8142b81"
  end

  conflicts_with "sentinel"

  def install
    bin.install "sentinel"
  end

  test do
    system "#{bin}/sentinel --version"
  end
end
