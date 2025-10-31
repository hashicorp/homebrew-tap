# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "1.18.16+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.18.16+ent/consul_1.18.16+ent_darwin_amd64.zip"
    sha256 "65dd03a66e6f80fb4636519128655e618b9af92cb7139b734ce9089c37fbb7ab"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.18.16+ent/consul_1.18.16+ent_darwin_arm64.zip"
    sha256 "d11012bee6839e10331a1e986b51f254331a3071f299363b312f8fb183ed2fbe"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.18.16+ent/consul_1.18.16+ent_linux_amd64.zip"
    sha256 "45f32360ba7d438bfc1ff512db7f7d5dd147e7ab5f5801f0eced4a4ff15ecd98"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.18.16+ent/consul_1.18.16+ent_linux_arm.zip"
    sha256 "9fa7299b6e46128ca14da170fe61cfd1c65750239e7f8d64d236724558a0bd0b"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.18.16+ent/consul_1.18.16+ent_linux_arm64.zip"
    sha256 "9cd812ea7db06b89b7d3a7f52d4bcd513166ab3b07226f341867a250067bceaf"
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
