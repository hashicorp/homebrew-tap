class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "1.0.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.0.3/consul-k8s_1.0.3_darwin_amd64.zip"
    sha256 "bd2d74a5eef4eef563b27e9d3083f428361d9840176d6c4eafec0718a5c78133"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-k8s/1.0.3/consul-k8s_1.0.3_darwin_arm64.zip"
    sha256 "868bd95f9ed269a9a6358c465503dd49bc053bd51d1ae0223fd5268839a961a3"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.0.3/consul-k8s_1.0.3_linux_amd64.zip"
    sha256 "0168efd79238be8056f9e30b2e1d49d7fcf0dcad878902702e0c6fc119e3a904"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.0.3/consul-k8s_1.0.3_linux_arm.zip"
    sha256 "34209929b7bcab35e6ea617d2c718864397c4ddc5dde30a9184271a30ed09ddf"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.0.3/consul-k8s_1.0.3_linux_arm64.zip"
    sha256 "540ace728775c0c09fe23236608c7d9432b384559496db6a354bb9908ce2a179"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
