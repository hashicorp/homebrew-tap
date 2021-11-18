class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "0.37.0"

  if OS.mac?
    url "https://releases.hashicorp.com/consul-k8s/0.37.0/consul-k8s_0.37.0_darwin_amd64.zip"
    sha256 "23a6d1d55c9083d67435cc34916b0680e7196c2d5037d43179bcf3d7d72de335"
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
    url "https://releases.hashicorp.com/consul-k8s/0.37.0/consul-k8s_0.37.0_linux_amd64.zip"
    sha256 "3e2a6e68aa63c8676bf110d240d3e2cd719c7d6c5f9ad741a1f9b58edc33909b"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/0.37.0/consul-k8s_0.37.0_linux_arm.zip"
    sha256 "3ebd43362150fbc75f31cf71fc392b3b26b6613b0f2ea53ccdec893d0d63a0d1"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/0.37.0/consul-k8s_0.37.0_linux_arm64.zip"
    sha256 "07943aedf3b11aa3211ef16910257b8799e3bdfd1614dad76992535ae29c163e"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
