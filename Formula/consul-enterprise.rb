class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "1.15.1+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.15.1+ent/consul_1.15.1+ent_darwin_amd64.zip"
    sha256 "c9df08b1733be32d8fb41ad903976f2dc6c5b59e76e7dbc7dc4f4d2241c49d6e"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.15.1+ent/consul_1.15.1+ent_darwin_arm64.zip"
    sha256 "2859c60251183a1a9266a45d1afdd0295b3584e817748792f8254dce1c47a25e"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.15.1+ent/consul_1.15.1+ent_linux_amd64.zip"
    sha256 "5e5f8c4a55567c37187de35c802eef2f04e9184c5a7bad64a914256b14701422"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.15.1+ent/consul_1.15.1+ent_linux_arm.zip"
    sha256 "7bc00fb0f373d9d71a8fa447602339033ad51bd2abbf1d084669adb2e6b76ac7"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.15.1+ent/consul_1.15.1+ent_linux_arm64.zip"
    sha256 "e2594c265b08b00a33dfeb65221876b63a25d34e5d4d8cb1c8e33d54d71ab503"
  end

  conflicts_with "consul-enterprise"

  def install
    bin.install "consul"
  end

  service do
    run [bin/"consul", "agent", "-dev", "-bind", "127.0.0.1"]
    keep_alive successful_exit: false
    working_dir var
    log_path var/"log/consul.log"
    error_log_path var/"log/consul.log"
  end

  test do
    system "#{bin}/consul --version"
  end
end
