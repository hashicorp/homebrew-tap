class ConsulEsm < Formula
  desc "Consul ESM"
  homepage "https://github.com/hashicorp/consul-esm"
  version "0.6.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-esm/0.6.2/consul-esm_0.6.2_darwin_amd64.zip"
    sha256 "4a20a6f611361fa9f5dfa9a15d906d6da4dd93cb1a7754b739ea67870323edda"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-esm/0.6.2/consul-esm_0.6.2_darwin_arm64.zip"
    sha256 "3dcbca0bbeab6ea54c161d604b57777e43ea9daa6d0a1f28067ecadf66877682"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-esm/0.6.2/consul-esm_0.6.2_linux_amd64.zip"
    sha256 "b1bc366a3a59ff3d78d6cdb2359b1a5d88e2aaf6efc7e378d615f2254c8d78fb"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-esm/0.6.2/consul-esm_0.6.2_linux_arm.zip"
    sha256 "91cf9482b21286450e1d1c692991324a8c210e0ea1e7d098c3d48d8ca563b04c"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-esm/0.6.2/consul-esm_0.6.2_linux_arm64.zip"
    sha256 "b280559732dc8887c6de9602476beb007edb5f6d995b4587c5ffc670d69fad19"
  end

  conflicts_with "consul-esm"

  def install
    bin.install "consul-esm"
  end

  test do
    system "#{bin}/consul-esm --version"
  end
end
