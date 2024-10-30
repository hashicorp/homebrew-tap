# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "1.20.1+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.20.1+ent/consul_1.20.1+ent_darwin_amd64.zip"
    sha256 "59121f2cdcf9c8df795c50409b68906158a013e5bc249f4721e09374a1007781"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.20.1+ent/consul_1.20.1+ent_darwin_arm64.zip"
    sha256 "8b5ef88458001a5b786659d4f192dd332d36e324f6360887623cdc30e06338eb"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.20.1+ent/consul_1.20.1+ent_linux_amd64.zip"
    sha256 "6938e496b9a5a1dd646f4225973864ac39be12089ecc40b3e52ff1275f1b81d2"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.20.1+ent/consul_1.20.1+ent_linux_arm.zip"
    sha256 "b365c7b33d2579fe56160f1c836bdc57c5f9830a02479d079b00e757d889963d"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.20.1+ent/consul_1.20.1+ent_linux_arm64.zip"
    sha256 "35c7e930ed4d7372448a3b6d0ddc5575032a822c680708a3e167ab9460c2d47f"
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
