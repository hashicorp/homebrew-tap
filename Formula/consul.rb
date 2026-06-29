# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class Consul < Formula
  desc "Consul"
  homepage "https://www.consul.io"
  version "2.0.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/2.0.1/consul_2.0.1_darwin_amd64.zip"
    sha256 "e5c1cf801dcd2f50cb0fec43feda03e74527fa4e28ee04890bfe3eb2ca0faaa1"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/2.0.1/consul_2.0.1_darwin_arm64.zip"
    sha256 "ab6f2baa756b7ade58b335ec98312ff8235bc3d6d520de9c7ec95bd9c8a13485"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/2.0.1/consul_2.0.1_linux_amd64.zip"
    sha256 "f8189736b05e3fe42d27dd83dfbd3a6d7e44b5669b2e51684362e9c1639babe0"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/2.0.1/consul_2.0.1_linux_arm.zip"
    sha256 "f208cb6d871fff12827d649c498e7b19b707ee53bcbcd4aa9b19da3a04e949f1"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/2.0.1/consul_2.0.1_linux_arm64.zip"
    sha256 "06a88f29c408f02a4c6388dccf30c059b8d8ce3778576701603fbb4dfc03b365"
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
