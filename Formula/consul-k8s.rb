class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "0.36.0"

  if OS.mac?
    url "https://releases.hashicorp.com/consul-k8s/0.36.0/consul-k8s_0.36.0_darwin_amd64.zip"
    sha256 "b4548b4f80ec56d026aef43969f03a38ff6d25a290e0869e5ee78cfba228bf5e"
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
    url "https://releases.hashicorp.com/consul-k8s/0.36.0/consul-k8s_0.36.0_linux_amd64.zip"
    sha256 "63fa210f98ddc10272fc7af3ea7ceaf49575a73174a5a8e41b3c3d543bfed95e"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/0.36.0/consul-k8s_0.36.0_linux_arm.zip"
    sha256 "ba4dbe1174c3dddc53a0239ad96b5a8f58a2a7ee98c844e2b941fb7fbae60dec"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/0.36.0/consul-k8s_0.36.0_linux_arm64.zip"
    sha256 "02c8b3dacfcfd95ce0dc7035be2ec0c6490c6de88968ed2b0790941c843db93d"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
