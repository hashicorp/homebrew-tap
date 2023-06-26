# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Consul < Formula
  desc "Consul"
  homepage "https://www.consul.io"
  version "1.16.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.16.0/consul_1.16.0_darwin_amd64.zip"
    sha256 "c4dff543cf33bcd165fcedcfc2a82ab446176013a0eccf0a8a48fc8cef92e64f"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.16.0/consul_1.16.0_darwin_arm64.zip"
    sha256 "8f44c7ddb1bd36bcea6711e2b6eece62b8d9b261fe341f5112ba165e2f77c828"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.16.0/consul_1.16.0_linux_amd64.zip"
    sha256 "c112d1b2ffcfa7d98cde5508bec3bce383ed3650290cc8be3cfe682b79bb13f1"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.16.0/consul_1.16.0_linux_arm.zip"
    sha256 "71a87898e95f0dcd84222d61405f6c41fe88dd86747967e902637ba07c8c23c7"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.16.0/consul_1.16.0_linux_arm64.zip"
    sha256 "e9b926bcd71f53ef0266141338e75c381a76d769756cc1a02b5250bbf6b7195e"
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
