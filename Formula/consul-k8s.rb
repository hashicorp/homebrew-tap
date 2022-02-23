class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "0.41.0"

  if OS.mac?
    url "https://releases.hashicorp.com/consul-k8s/0.41.0/consul-k8s_0.41.0_darwin_amd64.zip"
    sha256 "0ca08824e95d9eeee3e6e0e3e997d9d7edf1b3cde2b9301ce29d59c4ccdd6eca"
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
    url "https://releases.hashicorp.com/consul-k8s/0.41.0/consul-k8s_0.41.0_linux_amd64.zip"
    sha256 "6c963f6c8ac80ec11e70f0bb9f8e801969dd68fed2f0941ad69e9356deeae9ed"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/0.41.0/consul-k8s_0.41.0_linux_arm.zip"
    sha256 "391658c1e773e5080535f62fc2a6ed753354658b32fa7b019ed6eb4c0f293c62"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/0.41.0/consul-k8s_0.41.0_linux_arm64.zip"
    sha256 "9a3e32e70148d57de79ffedcd540a3b69d7d5605f617b9fb56d33733ccf9b5db"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
