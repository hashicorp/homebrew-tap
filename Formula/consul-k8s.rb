class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "0.26.0"

  if OS.mac?
    url "https://releases.hashicorp.com/consul-k8s/0.26.0/consul-k8s_0.26.0_darwin_amd64.zip"
    sha256 "dea88d28ae12a1e7f5bae0ebf8eb89d6a7bff0b36f39ba94c62ee17b878bc3eb"
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
    url "https://releases.hashicorp.com/consul-k8s/0.26.0/consul-k8s_0.26.0_linux_amd64.zip"
    sha256 "9fe6976bbfdfeac7f1947aba4a5ea792d3e3b9a131609fa79789911b652c96e3"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/0.26.0/consul-k8s_0.26.0_linux_arm.zip"
    sha256 ""
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/0.26.0/consul-k8s_0.26.0_linux_arm64.zip"
    sha256 "f9bbab8a19ca85c2518779379e3df5f4362d1d81fa8261c356e39dec9fb16709"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
