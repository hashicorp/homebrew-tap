class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.0.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.0.1/consul-dataplane_1.0.1_darwin_amd64.zip"
    sha256 "2877adf7bbdb80771788f7b98f03a40e73198cfd1bc371d463925212fda72fea"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-dataplane/1.0.1/consul-dataplane_1.0.1_darwin_arm64.zip"
    sha256 "c8e605686bd696b9c87b6e5cdb9b6fd64ac6631435d76852fd71041c616cabc8"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.0.1/consul-dataplane_1.0.1_linux_amd64.zip"
    sha256 "c20e3af505b8604951207e2feb54680c9deacfd426b7f7b0fce550d26d091992"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.0.1/consul-dataplane_1.0.1_linux_arm.zip"
    sha256 "50e34ce74a6c59887d0e86b2f985b2e6595fc91ab5c724c35d32c1fc9ceba0f9"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.0.1/consul-dataplane_1.0.1_linux_arm64.zip"
    sha256 "fb2b0e0fcbc13ba89db95795139bf82033f7c9c3460c6ad1e8c49980afb5788a"
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
