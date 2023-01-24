class ConsulEsm < Formula
  desc "Consul ESM"
  homepage "https://github.com/hashicorp/consul-esm"
  version "0.7.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-esm/0.7.1/consul-esm_0.7.1_darwin_amd64.zip"
    sha256 "ed9203f9f5a1a137929d1a5e0fef4b7cb99533f25f7100f38b1676086349c853"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-esm/0.7.1/consul-esm_0.7.1_darwin_arm64.zip"
    sha256 "73a3df86b0997d3051891a441401f5fe2c7a3dc8360d1b580ba7548d989acecd"
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
