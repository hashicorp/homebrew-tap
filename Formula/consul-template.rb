class ConsulTemplate < Formula
  desc "Consul Template"
  homepage "https://github.com/hashicorp/consul-template"
  version "0.29.6"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.29.6/consul-template_0.29.6_darwin_amd64.zip"
    sha256 "ac397f703e6e86c69967a045914817296951fa7568fb042b1191946dde604124"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-template/0.29.6/consul-template_0.29.6_darwin_arm64.zip"
    sha256 "0fc9b69194fdcbbdba40d0ace62e92ee0dd1d286345e7d9ff9cbf42699ec25fa"
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
