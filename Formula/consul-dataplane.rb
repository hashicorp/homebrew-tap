class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.0.0-beta2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.0.0-beta2/consul-dataplane_1.0.0-beta2_darwin_amd64.zip"
    sha256 "23d33342ea9a4e903d52191cb8a477bdb36de9b769d77197b77aaede0a0d5076"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-dataplane/1.0.0-beta2/consul-dataplane_1.0.0-beta2_darwin_arm64.zip"
    sha256 "01c75ef350f439b4ae31cf2143f1e86ece35236b73efbc0cef9cf9b25973125e"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.0.0-beta2/consul-dataplane_1.0.0-beta2_linux_amd64.zip"
    sha256 "6376e0aa7fb8df476aeece30236e7eeb2bad26d935ee945fdb8b29afeaf420d0"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.0.0-beta2/consul-dataplane_1.0.0-beta2_linux_arm.zip"
    sha256 "19d12e26766a3138fa5f28a6170df24da68a58a9902384ae42a7fa223d9dacee"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.0.0-beta2/consul-dataplane_1.0.0-beta2_linux_arm64.zip"
    sha256 "bc298116cb8990997453f2467bc415e3ff3d6377a8481b71fae28122dc15973f"
  end
  
  depends_on "envoy" => :recommended

  conflicts_with "consul-dataplane"

  def install
    bin.install "consul-dataplane"
  end

  test do
    system "#{bin}/consul-dataplane --version"
  end
end
