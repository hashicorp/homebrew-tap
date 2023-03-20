class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.1.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.1.0/consul-dataplane_1.1.0_darwin_amd64.zip"
    sha256 "58890e76a3b261c2cfe0760a28e89a50cd55f3acc91eedf4ea7ac4a4866e006e"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-dataplane/1.1.0/consul-dataplane_1.1.0_darwin_arm64.zip"
    sha256 "711613140d4df4799e6a8f5e2a297a59131a7a1fd68c8f3ea634082dfb1d02b2"
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
