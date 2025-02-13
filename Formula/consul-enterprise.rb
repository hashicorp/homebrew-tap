# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "1.20.3+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.20.3+ent/consul_1.20.3+ent_darwin_amd64.zip"
    sha256 "4b7fac69d0ccefc1f1a6a52680aa4b5578f02a3482385f3aef6cb515d0c10a14"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.20.3+ent/consul_1.20.3+ent_darwin_arm64.zip"
    sha256 "0439c0a41b6f7f2e1994a90b573988f9631a708b4ec86b013bc65b9031f14341"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.20.3+ent/consul_1.20.3+ent_linux_amd64.zip"
    sha256 "27dea9bc3dcd16ff698ecc8231016c85f1bd851a8fdc8a28d4526e744d39842a"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.20.3+ent/consul_1.20.3+ent_linux_arm.zip"
    sha256 "224bc98237b57d02c0357543bc3361fdbd6447cab53261ef892feb5cf0a9c3f0"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.20.3+ent/consul_1.20.3+ent_linux_arm64.zip"
    sha256 "bdc3d08538d0b7f6ad5e153a33fea140e4bddee0c9c3d2675b8663282a2bb95d"
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
