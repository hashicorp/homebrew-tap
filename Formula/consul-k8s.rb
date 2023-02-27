class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "1.1.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.1.0/consul-k8s_1.1.0_darwin_amd64.zip"
    sha256 "5d049a43d1a275baed5d005dd968668ecb246f44e3edd4f22eebe51271a232aa"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-k8s/1.1.0/consul-k8s_1.1.0_darwin_arm64.zip"
    sha256 "28524a163af5ef9eb94d9485d7be71b658188987c4f54c2f7f013f44c9933923"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.1.0/consul-k8s_1.1.0_linux_amd64.zip"
    sha256 "6680ad1b2a00e8eab3daaffe1937d8c3b9c12104e283060eac7ccc501ba33256"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.1.0/consul-k8s_1.1.0_linux_arm.zip"
    sha256 "032d6a736dbbb492ad149555ed231f44a48ddfc671c96a6fb0167d3e99009cf5"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.1.0/consul-k8s_1.1.0_linux_arm64.zip"
    sha256 "30d775cd94c7119f66e159aacd263e1aa578ba2e47d463d5fc5387762822889f"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
