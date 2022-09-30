class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "0.49.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/0.49.0/consul-k8s_0.49.0_darwin_amd64.zip"
    sha256 "416ead1c13bc26bc37f8163a01b73d20a40b67070bce6edf7fffa77fef0e8463"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-k8s/0.49.0/consul-k8s_0.49.0_darwin_arm64.zip"
    sha256 "6d911c6ed1293be3d29720abc9122d33ba3065639c3d3ff81d1355aec564c59f"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/0.49.0/consul-k8s_0.49.0_linux_amd64.zip"
    sha256 "b03cd6b9759dc387427920568d1107af2c726aff8e6823ed59631d8c9742cf5e"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/0.49.0/consul-k8s_0.49.0_linux_arm.zip"
    sha256 "2a1b257c94fca05b48f5b6dc0bfd2a1c3f4f8883ff653ef92f26a231cc2e00ab"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/0.49.0/consul-k8s_0.49.0_linux_arm64.zip"
    sha256 "7f9bb74d6940a22f66e191207fef89947d4327862e399ec94617fd1892667d57"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
