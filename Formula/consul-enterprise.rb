# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "1.19.2+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.19.2+ent/consul_1.19.2+ent_darwin_amd64.zip"
    sha256 "f881f50616c3e72656515fff1384e0fff80f62d9725134dae99c6377b1c0a2d2"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.19.2+ent/consul_1.19.2+ent_darwin_arm64.zip"
    sha256 "9e2959b44d0ba497d7790f96166bdf1f0d6b376692320296a37909fa1e4fa26b"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.19.2+ent/consul_1.19.2+ent_linux_amd64.zip"
    sha256 "815ae0801d31ddcd92d988c1ec54291131073c8e00e1fd71f6092f6d6df460fb"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.19.2+ent/consul_1.19.2+ent_linux_arm.zip"
    sha256 "1802be930ac43efc8b4c0a1352047e88e550d3e2bcef989df8129962b6a8337a"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.19.2+ent/consul_1.19.2+ent_linux_arm64.zip"
    sha256 "2cd09dd551f81537a24135c6283a32c358823a7ba4bc257ca6a689d757348d8d"
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
