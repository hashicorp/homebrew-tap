# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "1.22.6+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.22.6+ent/consul_1.22.6+ent_darwin_amd64.zip"
    sha256 "c4661c855b7aec45b0b06d8f66341246e3af6aee31ed76e257a7d33fcc0cb8a1"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.22.6+ent/consul_1.22.6+ent_darwin_arm64.zip"
    sha256 "9a1fb9088e76b552d02f32681fb2bd215c38cca1c288f97738ea6e7e6f6a80b9"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.22.6+ent/consul_1.22.6+ent_linux_amd64.zip"
    sha256 "6ce47bb6fdfa60c4473d9a63cccb4bf19ef7db50fb9e4cd1ff37f14edc5124b9"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.22.6+ent/consul_1.22.6+ent_linux_arm.zip"
    sha256 "56c2877da2a6c03af774936d7416417a9dc4e83713c19538edbea260eb627c20"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.22.6+ent/consul_1.22.6+ent_linux_arm64.zip"
    sha256 "0e3f011e71f48605d40f40b478ac158cfc54ecae789333549d9c365aef65ee09"
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
