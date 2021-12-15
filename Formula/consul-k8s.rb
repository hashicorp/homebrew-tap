class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "0.39.0"

  if OS.mac?
    url "https://releases.hashicorp.com/consul-k8s/0.39.0/consul-k8s_0.39.0_darwin_amd64.zip"
    sha256 "141020e608e9ca3b508e207b1c8a9f5aaafbd3a19fd57613fbc18d247fe378c2"
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
    url "https://releases.hashicorp.com/consul-k8s/0.39.0/consul-k8s_0.39.0_linux_amd64.zip"
    sha256 "156b63b1031a47f45ce16be4cbf3bcd8f2e152f0b86811b3db684cfb63371eca"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/0.39.0/consul-k8s_0.39.0_linux_arm.zip"
    sha256 "46295147bf4e0f4eb33b9fd726e35d127b469cd91f48486e4b67a836a31a2b43"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/0.39.0/consul-k8s_0.39.0_linux_arm64.zip"
    sha256 "0e9a11495749f706dd44443f3a6756eea098a65c9e5699c4685c60fb17858e78"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
