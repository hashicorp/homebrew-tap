# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "1.21.6+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.21.6+ent/consul_1.21.6+ent_darwin_amd64.zip"
    sha256 "8171d1b35b3ec7fd3da0fa3adfa031d24339d8b41c87ed2514e69bdafe1837a4"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.21.6+ent/consul_1.21.6+ent_darwin_arm64.zip"
    sha256 "7ad2099feb8e076c0914d0f0ac021fa3ba9b539d7836db0e4d5a32bba9549257"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.21.6+ent/consul_1.21.6+ent_linux_amd64.zip"
    sha256 "3bee9cc20663825d89534591ae0a0b492f4a3e23cd7093ffb7e35bfc51f5ae94"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.21.6+ent/consul_1.21.6+ent_linux_arm.zip"
    sha256 "0aac527de7f9cfbbf929f36bd172d4eddf33daeea40bdcb9330d3658699a7a74"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.21.6+ent/consul_1.21.6+ent_linux_arm64.zip"
    sha256 "9ed72e9ebdc3825346775c9ec9bb3cb9c0c494a040b3688fa12be88e34b55270"
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
