class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "0.43.0"

  if OS.mac?
    url "https://releases.hashicorp.com/consul-k8s/0.43.0/consul-k8s_0.43.0_darwin_amd64.zip"
    sha256 "d78dfdf395fafb1927708c3654570f9d58232b50f2290f952f0f34006b5de3ec"
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
    url "https://releases.hashicorp.com/consul-k8s/0.43.0/consul-k8s_0.43.0_linux_amd64.zip"
    sha256 "c3dca16efe0e21b9a4582718cfbfbc61c781593ce2e1f79aba15de3e2eece0f5"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/0.43.0/consul-k8s_0.43.0_linux_arm.zip"
    sha256 "5136469e7b41099b1a8594a8ddefd64f7ff322207c91b9f048c9c1a7aa767c79"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/0.43.0/consul-k8s_0.43.0_linux_arm64.zip"
    sha256 "aadd7f7194a511a14c8cd9fc70cc8e482bde957c9ef85864ac28ff09618af019"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
