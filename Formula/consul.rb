# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Consul < Formula
  desc "Consul"
  homepage "https://www.consul.io"
  version "1.19.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.19.1/consul_1.19.1_darwin_amd64.zip"
    sha256 "0b3b78d11d31a66938c9a90f5a9361e8363a43688f7f25fe300e37a95373d209"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.19.1/consul_1.19.1_darwin_arm64.zip"
    sha256 "f2fc99fa8fb5e193f3ceefc7594f11200fa539ddfa8800c5925c59f62facee48"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.19.1/consul_1.19.1_linux_amd64.zip"
    sha256 "aa48085aaa6f4130d0f1ee98c416dcd51b1b0f980d34f5b91834fd5b3387891c"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.19.1/consul_1.19.1_linux_arm.zip"
    sha256 "a4a54fd0ca6991d48d617311dfb1623d6030140a10c005ad33809dad864da239"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.19.1/consul_1.19.1_linux_arm64.zip"
    sha256 "9699e5a2b85b4447a81b01138c3e0ef42dbcdd9df4f04e9318af9017aae73cc4"
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
