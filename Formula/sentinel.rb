class Sentinel < Formula
  desc ""
  homepage "https://docs.hashicorp.com/sentinel"
  version "0.21.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.21.0/sentinel_0.21.0_darwin_amd64.zip"
    sha256 "79212c32a7e16e8e815898bb5b3db7bc2251b275472f961ac2e0ec24aa0c8aa0"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/sentinel/0.21.0/sentinel_0.21.0_darwin_arm64.zip"
    sha256 "5f994300e835cfc7901ada9e1ed007c39ea3287e6167568a1211ff628e9bd869"
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
