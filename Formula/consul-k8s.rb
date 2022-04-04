class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "0.42.0"

  if OS.mac?
    url "https://releases.hashicorp.com/consul-k8s/0.42.0/consul-k8s_0.42.0_darwin_amd64.zip"
    sha256 "2768b1e01afbc0cbe7a67d554826c52d0be06c0e11846f35d2c3fc07489fa654"
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
    url "https://releases.hashicorp.com/consul-k8s/0.42.0/consul-k8s_0.42.0_linux_amd64.zip"
    sha256 "33bcff021fad56b49c2ae51336eedcf0098d2319b2eca55e18da2b1968b5a8dd"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/0.42.0/consul-k8s_0.42.0_linux_arm.zip"
    sha256 "2c3a9a596a61086e92be870c92d965f29dfd155eb0e0026341c6dbf3af193c19"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/0.42.0/consul-k8s_0.42.0_linux_arm64.zip"
    sha256 "5dc1dec028a95622ee75f34dcdb738b9239ea59fdc21d17243e05d1894184562"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
