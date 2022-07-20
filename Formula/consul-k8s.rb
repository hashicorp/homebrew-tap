class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "0.45.0"

  if OS.mac?
    url "https://releases.hashicorp.com/consul-k8s/0.45.0/consul-k8s_0.45.0_darwin_amd64.zip"
    sha256 "f108f25f11815f075927e42680908a82776715997243a91475efcd8b9129e7a0"
  end

  if OS.mac? && Hardware::CPU.arm?
    def caveats
      <<~EOS
        The darwin_arm64 architecture is not supported for this product
        at this time, however we do plan to support this in the future. The
        darwin_amd64 binary has been installed and may work in
        compatibility mode, but it is not fully supported.
      EOS
    end
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/0.45.0/consul-k8s_0.45.0_linux_amd64.zip"
    sha256 "c9bb1047073649f6e0f40baf574b58884c4849f09ab6c8294b8460c5bbdfe91a"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/0.45.0/consul-k8s_0.45.0_linux_arm.zip"
    sha256 "368e598da4ac7de953e2f533f913bbdaba9f3545d7e9d413a0eb3dc716fb3ad7"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/0.45.0/consul-k8s_0.45.0_linux_arm64.zip"
    sha256 "e4206813ed6095119efee51cbbaa3d28ba26627f8522718338c1ba1c2ae6f0e6"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
