class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "0.40.0"

  if OS.mac?
    url "https://releases.hashicorp.com/consul-k8s/0.40.0/consul-k8s_0.40.0_darwin_amd64.zip"
    sha256 "2b296f542cc4850a6ea5e06b07d9ebd1d378832fa94a1fe4dc81a0173e50982e"
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
    url "https://releases.hashicorp.com/consul-k8s/0.40.0/consul-k8s_0.40.0_linux_amd64.zip"
    sha256 "fcea3f47d589e09c636d186ebbc0db7da2946954a9bd0a0c63ce6aafd3dea5a7"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/0.40.0/consul-k8s_0.40.0_linux_arm.zip"
    sha256 "a6110a73280d252ee3807f79bfdee6c3ae004f53297d91450bb78adc6807e86a"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/0.40.0/consul-k8s_0.40.0_linux_arm64.zip"
    sha256 "85f15513c697d34d63e69b4cec951e372d52620b9cc1579cdd9b97581e715c02"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
