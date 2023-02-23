class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.1.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.1.0/consul-dataplane_1.1.0_darwin_amd64.zip"
    sha256 "e0c72e241b18c492c3b4c2aab3427b7806705ff77089dbee23b40b650b2e4a58"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-dataplane/1.1.0/consul-dataplane_1.1.0_darwin_arm64.zip"
    sha256 "eec0f4e8e07777b1210e477f1f20ebb2b870fbf58c4e07f5ca97bf1d97782cf1"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.1.0/consul-dataplane_1.1.0_linux_amd64.zip"
    sha256 "738a7c2f1b285804aa9378c1e2c4d48e44b4fe55ccdb323495fc84afa8ed8fdc"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.1.0/consul-dataplane_1.1.0_linux_arm.zip"
    sha256 "e1cd6d56e3003d5ee7527d85daaec517f4f4422dc580a4e40bc8a46514214269"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.1.0/consul-dataplane_1.1.0_linux_arm64.zip"
    sha256 "326caf6aa0f641bed626cbc195e8243f87e61ab7f8de38fd0943706fe8c3cd6a"
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
