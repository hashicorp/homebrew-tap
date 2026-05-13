# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "1.22.7+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.22.7+ent/consul_1.22.7+ent_darwin_amd64.zip"
    sha256 "29f1078c90d7f468ad4aeb9ac84a4a2c19268408795b10af2e8d6913a140a963"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.22.7+ent/consul_1.22.7+ent_darwin_arm64.zip"
    sha256 "7ed4ad06f956738bbe1c87f6011a62c2bd1374bd481790a1c7ecadbc0f6a3ca3"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.22.7+ent/consul_1.22.7+ent_linux_amd64.zip"
    sha256 "4ba0e2c86160ed88457abe5fb5cdef786cd460f627979338298778af3db49548"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.22.7+ent/consul_1.22.7+ent_linux_arm.zip"
    sha256 "10c6910ee21b1ffa95146b7f7194227e3096e26ccb94ded59e20f136204458a3"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.22.7+ent/consul_1.22.7+ent_linux_arm64.zip"
    sha256 "b471c1fb7bc89cd5fa607de1e767c29bc776c1e498ef4662793d7c19f0cc1056"
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
