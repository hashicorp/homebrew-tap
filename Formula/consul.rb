# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Consul < Formula
  desc "Consul"
  homepage "https://www.consul.io"
  version "1.20.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.20.3/consul_1.20.3_darwin_amd64.zip"
    sha256 "5d4cd5f1d9560fc420104782ce3a8f29c040c3f6a454fc2af6861aad6cd6b748"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.20.3/consul_1.20.3_darwin_arm64.zip"
    sha256 "65438a37a92b708bf879d172dbf7211b11d4cfee8285f276e38fac83012418ca"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.20.3/consul_1.20.3_linux_amd64.zip"
    sha256 "23f55df756d6fd9dbf11973738468183599b66e737bf50cd7d1f29ed92a79776"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.20.3/consul_1.20.3_linux_arm.zip"
    sha256 "1390a61b80e8218ce738f4a0932e775370949be42c7beb995a3b6db9cb1c5d35"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.20.3/consul_1.20.3_linux_arm64.zip"
    sha256 "e67b750f0e204c9d1d5ab62bfcb94e7b86e334b622154495de31d66d5f8f94b4"
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
