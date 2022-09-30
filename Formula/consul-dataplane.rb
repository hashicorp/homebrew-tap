class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.0.0-beta1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.0.0-beta1/consul-dataplane_1.0.0-beta1_darwin_amd64.zip"
    sha256 "fd647458644e93b829409d20d6d1063365eae42a50a0f58abd42e3972818eb9c"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-dataplane/1.0.0-beta1/consul-dataplane_1.0.0-beta1_darwin_arm64.zip"
    sha256 "88c27265a221843fc27dfd89dc1cfc5de4599538124cadb8ad8d9e5f0a32d96c"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.0.0-beta1/consul-dataplane_1.0.0-beta1_linux_amd64.zip"
    sha256 "4d802c06413d6374461aae89bc2fc1d2b067088f4a4bb89672d573322658fdff"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.0.0-beta1/consul-dataplane_1.0.0-beta1_linux_arm.zip"
    sha256 "db8bb803ce94832e44e262a5a18633e3af2cb39118e5d5c71c5a70668540453a"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.0.0-beta1/consul-dataplane_1.0.0-beta1_linux_arm64.zip"
    sha256 "77e43779bb348da5b4d2e1b0ca476c17fe5ddf4b473cb885d30af81b05a94cc2"
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
