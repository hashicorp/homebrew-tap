# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "1.18.0+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.18.0+ent/consul_1.18.0+ent_darwin_amd64.zip"
    sha256 "57947afd052d1d4d4f2244f60e53a1ff0ab2ce5ddb318fcc7d0fcec3308e410c"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.18.0+ent/consul_1.18.0+ent_darwin_arm64.zip"
    sha256 "1f3a4bef98f1f1f8d5e217a97e54fe880c920443a35ca94c1f5aa9345b6c44ff"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.18.0+ent/consul_1.18.0+ent_linux_amd64.zip"
    sha256 "06d5a03c12e5fece1ab54f9c19991cedd4bf2452db8365f1cd64e16c056e3840"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.18.0+ent/consul_1.18.0+ent_linux_arm.zip"
    sha256 "ce16d7fe0b7320a953baa97c74ff51c68a437a138589fa345fdf197d796897e8"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.18.0+ent/consul_1.18.0+ent_linux_arm64.zip"
    sha256 "6d46590a04a7f7303400f81d96044bf2477ddf2dcc548fd8707737b77b38e13f"
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
