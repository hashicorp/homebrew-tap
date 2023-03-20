class Sentinel < Formula
  desc ""
  homepage "https://docs.hashicorp.com/sentinel"
  version "0.21.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.21.0/sentinel_0.21.0_darwin_amd64.zip"
    sha256 "86ac1c9a7e82f85f1564f2be145955a93bee94e84a959df706652a7e00e7b01c"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/sentinel/0.21.0/sentinel_0.21.0_darwin_arm64.zip"
    sha256 "452f574a2c90f5654c2aa4e5235103c9e8730ef1e5085b73d2dd84a467f4784d"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.21.0/sentinel_0.21.0_linux_amd64.zip"
    sha256 "9de8e4c142ede53eea4873faa2bad2a5d47a46e4b02dbee8b69d6988c4ed6e1f"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.21.0/sentinel_0.21.0_linux_arm.zip"
    sha256 "2e4d210aa248aa733edb03f2518335e7d8fa6ccaa70d9d73a48b78e40e650fc6"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.21.0/sentinel_0.21.0_linux_arm64.zip"
    sha256 "cecc20f3ece9a26741e34427aed776f9b14095ac4796bb91c7ef67b3cd93b0a8"
  end

  conflicts_with "sentinel"

  def install
    bin.install "sentinel"
  end

  test do
    system "#{bin}/sentinel --version"
  end
end
