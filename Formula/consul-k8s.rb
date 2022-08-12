class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "0.47.0"

  if OS.mac?
    url "https://releases.hashicorp.com/consul-k8s/0.47.0/consul-k8s_0.47.0_darwin_amd64.zip"
    sha256 "4d580b2b9beb0e03df98028b37c6ccde4d2241950621fba29cdfe4efbdf7ea3e"
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
    url "https://releases.hashicorp.com/consul-k8s/0.47.0/consul-k8s_0.47.0_linux_amd64.zip"
    sha256 "0e1aa687d180747f37a6ca2f8f352c85916b5a60495e3eed5b92e15365a1e5b3"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/0.47.0/consul-k8s_0.47.0_linux_arm.zip"
    sha256 "264de024fb8bfdad7f9d19bc4f2652c2456784011ab769bc0340cb1eba2652bd"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/0.47.0/consul-k8s_0.47.0_linux_arm64.zip"
    sha256 "4c657ca5ba4a852429031ee701a8713c814083217f4f098872bbd10dd41bab32"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
