# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "1.15.4+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.15.4+ent/consul_1.15.4+ent_darwin_amd64.zip"
    sha256 "6bfa44f2ca060a8304938cf7226bfb168d2ee300db202e9da9d5a4059f636b00"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.15.4+ent/consul_1.15.4+ent_darwin_arm64.zip"
    sha256 "7b34e220c3ac4b20562955fee910ab553580b3b2316d9696f7d78356830b9d05"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.15.4+ent/consul_1.15.4+ent_linux_amd64.zip"
    sha256 "42f068bbd32f17df7126b64c0b039e7a42ff848e139f8e52b32248b782cf4659"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.15.4+ent/consul_1.15.4+ent_linux_arm.zip"
    sha256 "41ed02ef42502122be8f2ee6fc8f6985019e8820d9ee31bba959e1ccc3be1ca2"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.15.4+ent/consul_1.15.4+ent_linux_arm64.zip"
    sha256 "d3d34998bc758dde1fc8409dca575a383bd814f8fc554e244c8578fd17b443a0"
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
