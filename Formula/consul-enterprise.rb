# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "1.21.5+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.21.5+ent/consul_1.21.5+ent_darwin_amd64.zip"
    sha256 "a610f2cff459c9c0a7c06993ab196aa075b8b6292b53cde30f3cb06db420087d"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.21.5+ent/consul_1.21.5+ent_darwin_arm64.zip"
    sha256 "def5e55bdb4d4c39036d0ae0bf0c6c9fa02cbb126bd22e774546d6fc67f7d0b9"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.21.5+ent/consul_1.21.5+ent_linux_amd64.zip"
    sha256 "53cfa17ab9a2f40db322e2e115d55fa5bad42d29fd09ef6dae7b84a89796a05a"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.21.5+ent/consul_1.21.5+ent_linux_arm.zip"
    sha256 "3e9367f4f073e98dc8aad16673df7117fcc15501f945f71a9978a387c9eef967"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.21.5+ent/consul_1.21.5+ent_linux_arm64.zip"
    sha256 "b24f4acc7acaa8b6619d5ce375d9fb0313dbd6451631af229452f2e70b48eb95"
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
