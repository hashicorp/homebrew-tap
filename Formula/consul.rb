# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Consul < Formula
  desc "Consul"
  homepage "https://www.consul.io"
  version "1.20.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.20.0/consul_1.20.0_darwin_amd64.zip"
    sha256 "5e5fcd0adaf647b7aec9bcde8de828d90a4e06a26628ff241537b8d587bd276a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.20.0/consul_1.20.0_darwin_arm64.zip"
    sha256 "4b5276a3ebcc7b487b48fd8dd93afcf846ce7ed0e7aaeb9012d1f840f4e437a1"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.20.0/consul_1.20.0_linux_amd64.zip"
    sha256 "da7a71476f8a83f69853c95316518b888d5863ce3b326523bb8e3ad1a302ed64"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.20.0/consul_1.20.0_linux_arm.zip"
    sha256 "c94dbfaf5c27a364a32a412510a0e67f58864fd6826b9fd692cb0f3d5cc1887d"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.20.0/consul_1.20.0_linux_arm64.zip"
    sha256 "338bc227546f3000898e8622e63deeeff5359c0241fb19fd6c9c2ee1844b3a8e"
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
