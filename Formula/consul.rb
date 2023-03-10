class Consul < Formula
  desc "Consul"
  homepage "https://www.consul.io"
  version "1.15.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.15.1/consul_1.15.1_darwin_amd64.zip"
    sha256 "9080598e31cbf49adb20f554567479bc74bdfa768ea193bb76dd98df96924dc4"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.15.1/consul_1.15.1_darwin_arm64.zip"
    sha256 "956df597f3b0e8e4443fac3c7769385e89390cca598a8a5b9b728265730cd546"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.15.1/consul_1.15.1_linux_amd64.zip"
    sha256 "23f7eb0461dd01a95c5d56472b91c22d5dacec84f31f1846c0c9f9621f98f29f"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.15.1/consul_1.15.1_linux_arm.zip"
    sha256 "09c53fc66d46b132d5f7acb7d21758056602be9495c8a1d409ec8cef45328dd8"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.15.1/consul_1.15.1_linux_arm64.zip"
    sha256 "4e5e42186ff9f7a3e9736f871a81ff3732f7e150664376e1bf290661544a4654"
  end

  conflicts_with "consul"

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
