class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "0.38.0"

  if OS.mac?
    url "https://releases.hashicorp.com/consul-k8s/0.38.0/consul-k8s_0.38.0_darwin_amd64.zip"
    sha256 "23858be270adc6330281349b9cdbae8b9ebf9a5f62fb324da1329ea8b3526d91"
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
    url "https://releases.hashicorp.com/consul-k8s/0.38.0/consul-k8s_0.38.0_linux_amd64.zip"
    sha256 "d22e82e09d28d66d65a2945226af4cb5f6e0c9ddfe09f8e4c87297e87fb94bda"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/0.38.0/consul-k8s_0.38.0_linux_arm.zip"
    sha256 "efa2725fecc22b4becf4c52a2e896e547f17c3abfadbca1a24a090628aaa9be8"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/0.38.0/consul-k8s_0.38.0_linux_arm64.zip"
    sha256 "28b9e2e57c5d3af341d4d31f792bf09b5dc34d939eb3ced75825556cb7f35d3f"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
