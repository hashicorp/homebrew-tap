class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "0.47.1"

  if OS.mac?
    url "https://releases.hashicorp.com/consul-k8s/0.47.1/consul-k8s_0.47.1_darwin_amd64.zip"
    sha256 "e727748d1b7270e33cb2e66c59517dbb24f6ef4119e26ace043c05f671c1b0d0"
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
    url "https://releases.hashicorp.com/consul-k8s/0.47.1/consul-k8s_0.47.1_linux_amd64.zip"
    sha256 "76afd1cdd609c02823fb4fe2312d12252d5c82bfb3e517db1ff2ee736ee00abc"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/0.47.1/consul-k8s_0.47.1_linux_arm.zip"
    sha256 "4d33d3c14ddadd0ab32e6d5baa60df91625cbd2aea89e9769a49e658d9dacf7a"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/0.47.1/consul-k8s_0.47.1_linux_arm64.zip"
    sha256 "97d04bfc227f7765cf27dbff8d59eeafd162c62eac58360666df2042e8d9191c"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
