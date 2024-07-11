# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "1.19.1+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.19.1+ent/consul_1.19.1+ent_darwin_amd64.zip"
    sha256 "082cdc018c02e17e70bb4be288ec6dbaf1f02396162e7d030373da001dde68e0"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.19.1+ent/consul_1.19.1+ent_darwin_arm64.zip"
    sha256 "601429838a243f4a81b2996eecbb56ba54779a659bd8c6aae57d2d39f87ab55e"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.19.1+ent/consul_1.19.1+ent_linux_amd64.zip"
    sha256 "98563295c336745f3a287d027e9f7f53bd3b769473e5b1b96b971588ac821eb4"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.19.1+ent/consul_1.19.1+ent_linux_arm.zip"
    sha256 "46078035d5ec9461b3261193b6071dd8399a89ad5d122d0b524b24799f4fed65"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.19.1+ent/consul_1.19.1+ent_linux_arm64.zip"
    sha256 "7716e05d5f224229074a5d13d855ad9a7d7c27d08093f91a4b50a65454b7fe43"
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
