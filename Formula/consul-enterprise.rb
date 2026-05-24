# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "2.0.0+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/2.0.0+ent/consul_2.0.0+ent_darwin_amd64.zip"
    sha256 "03e02afa2f9bb09bff2584f8e9fca5aa4538e87357b5d010825ef6d8c6e07bee"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/2.0.0+ent/consul_2.0.0+ent_darwin_arm64.zip"
    sha256 "a1d75ec6fe1efb7e55c763afc698cea23f1dfa075b441a5161d63210cdad6ff9"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/2.0.0+ent/consul_2.0.0+ent_linux_amd64.zip"
    sha256 "2b0068a416d8ab3c39d574a218b44d47146ee84081251ea3e3a713921939143d"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/2.0.0+ent/consul_2.0.0+ent_linux_arm.zip"
    sha256 "e6e19daf5e6500198b74a74f0bfa81fc79ab8e7f55c42cce790a51ee934d01e7"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/2.0.0+ent/consul_2.0.0+ent_linux_arm64.zip"
    sha256 "9a533f17e28e2ae6564434094c94c46e9b5a6aee8b27e5fa274b7aadba292f82"
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
