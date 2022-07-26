class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "0.46.1"

  if OS.mac?
    url "https://releases.hashicorp.com/consul-k8s/0.46.1/consul-k8s_0.46.1_darwin_amd64.zip"
    sha256 "7e8620a8746c1e3216f0c79f10096fef53db0dde4229d4176cb4a0edadaa2054"
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
    url "https://releases.hashicorp.com/consul-k8s/0.46.1/consul-k8s_0.46.1_linux_amd64.zip"
    sha256 "5e411a28667348061cc00a9dbcc5d4ab2f60b5d99c7f33c44d6a827a8629e792"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/0.46.1/consul-k8s_0.46.1_linux_arm.zip"
    sha256 "f00ff66ceb1e12c26f0fbe378d3548996260d03c81cfbbea6ae53eae2e65d267"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/0.46.1/consul-k8s_0.46.1_linux_arm64.zip"
    sha256 "5dc4654b6c1d26c300de678b6c2e0b282fa09ed847cc0f89a1c149d7c7367bec"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
