class ConsulEsm < Formula
  desc "Consul ESM"
  homepage "https://github.com/hashicorp/consul-esm"
  version "0.7.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-esm/0.7.0/consul-esm_0.7.0_darwin_amd64.zip"
    sha256 "ff5d2b1c2e6b15e2be23ab45ae62456f039cba03c2dd0f547e6231157acb158a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-esm/0.7.0/consul-esm_0.7.0_darwin_arm64.zip"
    sha256 "df9c61a5eb462e1b133d9c2ac7cf52456d3c8d8e442b87ff74f91d017e09b9b9"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-esm/0.7.0/consul-esm_0.7.0_linux_amd64.zip"
    sha256 "03bc6d53996c1bca871f2f5891c52d2c1abd1604903d81fd08e43bfd182586b3"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-esm/0.7.0/consul-esm_0.7.0_linux_arm.zip"
    sha256 "e11da4113501f10b2d954fb5cedfbc977f266ed1bff9792ba9b585ee5b0e7775"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-esm/0.7.0/consul-esm_0.7.0_linux_arm64.zip"
    sha256 "2ed09b8fa8b7220a80660209afd1e7e270e847fbf07adb23eceae812618cd28f"
  end

  conflicts_with "consul-esm"

  def install
    bin.install "consul-esm"
  end

  test do
    system "#{bin}/consul-esm --version"
  end
end
