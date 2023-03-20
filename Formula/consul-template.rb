class ConsulTemplate < Formula
  desc "Consul Template"
  homepage "https://github.com/hashicorp/consul-template"
  version "0.29.6"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.29.6/consul-template_0.29.6_darwin_amd64.zip"
    sha256 "598053c1bf5210f3bbc2134565018bd9f6f04e35610134538431ed9a5b72b12b"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-template/0.29.6/consul-template_0.29.6_darwin_arm64.zip"
    sha256 "23cfd78865bd9dfa5da590bf742b7d66e8c8ca306a782b035e6089bc7e02e56c"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.29.6/consul-template_0.29.6_linux_amd64.zip"
    sha256 "0e653b76f8eb7712687fc407c4ae62206304d01c9d76d4c4d2e51d41570c8ac1"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.29.6/consul-template_0.29.6_linux_arm.zip"
    sha256 "d7ef758a56398fcd0ddd571ab7ab755c27eb1457e87414c2c9279095d28f52ca"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.29.6/consul-template_0.29.6_linux_arm64.zip"
    sha256 "faab610b5e3a28ca4a8e258974e3fbaf229ef6057d7181beecc5149e32c1d085"
  end

  conflicts_with "consul-template"

  def install
    bin.install "consul-template"
  end

  test do
    system "#{bin}/consul-template --version"
  end
end
