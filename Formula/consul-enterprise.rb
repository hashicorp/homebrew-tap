# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "1.20.0+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.20.0+ent/consul_1.20.0+ent_darwin_amd64.zip"
    sha256 "5b0480184f6f5fc16018f15fb11616975840c5a6f19f902399092b8da3a14184"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.20.0+ent/consul_1.20.0+ent_darwin_arm64.zip"
    sha256 "0ad15d7145345224f2e4f061015ce195c6eb266ab46cb6282e6fef2dc90426ef"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.20.0+ent/consul_1.20.0+ent_linux_amd64.zip"
    sha256 "34d8302cf14030a97c284ac58d386bc8bfbf857f17440b0775f668bc05b26d11"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.20.0+ent/consul_1.20.0+ent_linux_arm.zip"
    sha256 "c5ecdc414108807cf87a0ec6432c0afa3e7d16a0811637ff9b53f22224620986"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.20.0+ent/consul_1.20.0+ent_linux_arm64.zip"
    sha256 "272e4085c88e90a75237c3422d03e08d1d39b42906ea79f9d63ed0571cc6983c"
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
