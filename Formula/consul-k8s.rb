class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "1.0.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.0.0/consul-k8s_1.0.0_darwin_amd64.zip"
    sha256 "14775f24394b09494d82be17609bec87749e95681f30db3b8c01b881609eb854"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-k8s/1.0.0/consul-k8s_1.0.0_darwin_arm64.zip"
    sha256 "14e13505a9f987511e5ea7d865b17fd9447f6ba5c2206c739454b1f284c8cf35"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.0.0/consul-k8s_1.0.0_linux_amd64.zip"
    sha256 "2c727f73601838c06cc460f4ab0469a894b1ebb8ee801d7ab3154f3b32db505d"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.0.0/consul-k8s_1.0.0_linux_arm.zip"
    sha256 "605cca813903e5bd198e7a3a0c0d837310ed5ca3f47a82a598f7e1d350220bd1"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.0.0/consul-k8s_1.0.0_linux_arm64.zip"
    sha256 "fabada21ed7c5b984dcb6bb8102a23af3e178bbab97c3a75dd7fe163959754a9"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
