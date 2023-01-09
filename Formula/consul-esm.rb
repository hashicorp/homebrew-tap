class ConsulEsm < Formula
  desc "Consul ESM"
  homepage "https://github.com/hashicorp/consul-esm"
  version "0.7.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-esm/0.7.1/consul-esm_0.7.1_darwin_amd64.zip"
    sha256 "49179b8d309e2d119da47f044de6200fb49eb25b48656726510c001550f8a4b0"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-esm/0.7.1/consul-esm_0.7.1_darwin_arm64.zip"
    sha256 "494aab2014e522977e8136725d59e58afc980620683b859adaae2cf2c11fb705"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-esm/0.7.1/consul-esm_0.7.1_linux_amd64.zip"
    sha256 "bc1d8c351d277bb1e93d3d2a209b9282ee5d84e3a82ce3c38281f40318b5268f"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-esm/0.7.1/consul-esm_0.7.1_linux_arm.zip"
    sha256 "01acf7c989820f399effedd75a3bfa189de5e3853b58bb670b070fd9445f8594"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-esm/0.7.1/consul-esm_0.7.1_linux_arm64.zip"
    sha256 "47e607ef585fb0f4fdffa9de9364e28ecba7a1c9dc80734d4a20f5744d5a37d8"
  end

  conflicts_with "consul-esm"

  def install
    bin.install "consul-esm"
  end

  test do
    system "#{bin}/consul-esm --version"
  end
end
