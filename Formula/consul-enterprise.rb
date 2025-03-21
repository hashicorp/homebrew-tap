# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "1.20.5+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.20.5+ent/consul_1.20.5+ent_darwin_amd64.zip"
    sha256 "10bf8a9e8de402e4c10b82edec28b11cec62c669f3257bc76234381f25c530f3"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.20.5+ent/consul_1.20.5+ent_darwin_arm64.zip"
    sha256 "dfb565af1f8d9efc08a9749df4a65b3ea3650250e305fc5b084ec1b1d8cb723a"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.20.5+ent/consul_1.20.5+ent_linux_amd64.zip"
    sha256 "48e6664c171e112676bab636d6c7a2063e577255e613bf40c8e371a5e63f96ac"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.20.5+ent/consul_1.20.5+ent_linux_arm.zip"
    sha256 "2fc7e46866d1d53d097138c6ab2831079ec884ebedbb935a2f725134fdbd8a82"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.20.5+ent/consul_1.20.5+ent_linux_arm64.zip"
    sha256 "e07bdbc1cd28c9871d82aa7a0ad87a9653e68e15056acc6180e044396587d25b"
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
