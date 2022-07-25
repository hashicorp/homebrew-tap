class Sentinel < Formula
  desc ""
  homepage "https://docs.hashicorp.com/sentinel"
  version "0.18.11"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.18.11/sentinel_0.18.11_darwin_amd64.zip"
    sha256 "267f2d2d2bf62476c6b40f112b7c222966da4ee27098cadb99e4446b48e9b68a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/sentinel/0.18.11/sentinel_0.18.11_darwin_arm64.zip"
    sha256 "c6c638426c8ef50b5b8500e082a0e8b116f7311f2ee24d24336f22d64b23c5a0"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.18.11/sentinel_0.18.11_linux_amd64.zip"
    sha256 "d46b0bae06fc83354efb364446fa77b807ef99f6a61f5c9652ad792d1e436f7c"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.18.11/sentinel_0.18.11_linux_arm.zip"
    sha256 "ed280d8f250638403e45142b8c02e4179641b47e091dc720eac8fa812ef2343f"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.18.11/sentinel_0.18.11_linux_arm64.zip"
    sha256 "435a4e9b95556f17d22c41f9f8801e27874879cfd12c8d008231feb4ebac617a"
  end

  conflicts_with "sentinel"

  def install
    bin.install "sentinel"
  end

  test do
    system "#{bin}/sentinel --version"
  end
end
