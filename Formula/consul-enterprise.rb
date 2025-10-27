# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "1.22.0+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.22.0+ent/consul_1.22.0+ent_darwin_amd64.zip"
    sha256 "474f5abe7677485f4a7704dbbb4e6d81ca4db2c5aa43c6af80df03ee560b6010"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.22.0+ent/consul_1.22.0+ent_darwin_arm64.zip"
    sha256 "26cdd9f68b1d178c29e6d4066db350c68e99cb104cd4caa80603226ba25afdce"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.22.0+ent/consul_1.22.0+ent_linux_amd64.zip"
    sha256 "49e5639a4f11cf9db120ab41d120de6ee1151f30735d29d495152cf4634fd925"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.22.0+ent/consul_1.22.0+ent_linux_arm.zip"
    sha256 "d2ce6af1d9cc0dc830597e1f97753bdcac95c4ed8fd70d19ebe25b8faf29ea8c"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.22.0+ent/consul_1.22.0+ent_linux_arm64.zip"
    sha256 "c7c289c7d4a06e6d7558d76231e86106784f8c5339c3e3c7eaa5978887b134d5"
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
