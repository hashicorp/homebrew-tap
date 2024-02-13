# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Consul < Formula
  desc "Consul"
  homepage "https://www.consul.io"
  version "1.17.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.17.3/consul_1.17.3_darwin_amd64.zip"
    sha256 "3b1fabb93b349fb092d74a1b71d070198088bf708a8c77898c9baed1b4162dc1"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.17.3/consul_1.17.3_darwin_arm64.zip"
    sha256 "888d7b9cd3efa93fd89dfbcd30b74dae51ae6add252d4a1207820f04b35c1494"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.17.3/consul_1.17.3_linux_amd64.zip"
    sha256 "bb71f4b9b465e314af0d98f5a6884794be9a44e930180537f0825ae9939461a4"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.17.3/consul_1.17.3_linux_arm.zip"
    sha256 "7c0b3551f3330258ebfaa6877a4c907e9ba47a2c7e0018a3c63f8dfc1288a246"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.17.3/consul_1.17.3_linux_arm64.zip"
    sha256 "e06c529ff108314bbb3705ed63b744c3b91aa33791d88c7e7c73d26cb8200c0b"
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
