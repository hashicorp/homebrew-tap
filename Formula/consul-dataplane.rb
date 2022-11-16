class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.0.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.0.0/consul-dataplane_1.0.0_darwin_amd64.zip"
    sha256 "1aef0c3697ebb85ff7552b50fa8c034156421a2ccc65867787c7697d35b3fd6d"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-dataplane/1.0.0/consul-dataplane_1.0.0_darwin_arm64.zip"
    sha256 "cdc6ba940cb75df257f4a4b5910a4871a57d98f258453f9fb0e658e747dc214b"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.0.0/consul-dataplane_1.0.0_linux_amd64.zip"
    sha256 "aec00d86d54368d41fe32016417be36a6d59b225ece2c906204775c903fb7889"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.0.0/consul-dataplane_1.0.0_linux_arm.zip"
    sha256 "aec23b8af3b1c8aefa888e3c707ba83c7e3bc4524c6e895eab48fb1db86e58e7"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.0.0/consul-dataplane_1.0.0_linux_arm64.zip"
    sha256 "0465ab255787cdb920c4c4893797d90940ea92f10c07b0ee529e1ecf788309ed"
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
