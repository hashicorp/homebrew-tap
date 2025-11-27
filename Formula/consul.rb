# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Consul < Formula
  desc "Consul"
  homepage "https://www.consul.io"
  version "1.22.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.22.1/consul_1.22.1_darwin_amd64.zip"
    sha256 "1d8f48639618b8d293e3cfe7855df9fb53c802262848053bf45c260fd7427493"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.22.1/consul_1.22.1_darwin_arm64.zip"
    sha256 "1bbbdc43ac23321f402d661b20dd0d291047ecbda2dbfe93e4b4ce26cf2c701d"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.22.1/consul_1.22.1_linux_amd64.zip"
    sha256 "91222c7ec141f1c2c92f6b732eeb0251220337e4c07c768cbc6ae633fef69733"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.22.1/consul_1.22.1_linux_arm.zip"
    sha256 "b677d91e3613103ce24fd3cd1d66d12047985d17970ae8c8986fb8282a9b79bd"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.22.1/consul_1.22.1_linux_arm64.zip"
    sha256 "d421c4537b57935a949b9bc34252266672fe484a766a05ec5826bbae16c8f323"
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
