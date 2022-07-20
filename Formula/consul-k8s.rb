class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "0.46.0"

  if OS.mac?
    url "https://releases.hashicorp.com/consul-k8s/0.46.0/consul-k8s_0.46.0_darwin_amd64.zip"
    sha256 "9df3a9dc2a15a6a7bbc30eb03e70d800f4aae5e6b566442b1e9a708d562331a2"
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
    url "https://releases.hashicorp.com/consul-k8s/0.46.0/consul-k8s_0.46.0_linux_amd64.zip"
    sha256 "1a4bcbea49f700d513984de34455256330a955889319b265aba61d0e8c08bb7b"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/0.46.0/consul-k8s_0.46.0_linux_arm.zip"
    sha256 "ed3f8cf737e0de7e1b88aea9f707047d260e41a79ea0584840fee64c610a1e38"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/0.46.0/consul-k8s_0.46.0_linux_arm64.zip"
    sha256 "6ef31d4bcb5823cf9472035b8bd58cd459943aff47bd30d446ae870b71cce038"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
