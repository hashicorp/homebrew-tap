# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "1.20.2+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.20.2+ent/consul_1.20.2+ent_darwin_amd64.zip"
    sha256 "4903002c9b197025571a606a6b6b7d9b4d83b3d20a38a85eb836e54f8aea5d8b"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.20.2+ent/consul_1.20.2+ent_darwin_arm64.zip"
    sha256 "80170604329f12a354c2bb932aa94985f9e93e36efa604240cbc1c4404354d0c"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.20.2+ent/consul_1.20.2+ent_linux_amd64.zip"
    sha256 "673daaf5542e07515932cc2f5eb94b0447a5aed387cc3ec0e8043676fc0d9612"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.20.2+ent/consul_1.20.2+ent_linux_arm.zip"
    sha256 "dbd3ba97d7a961a095cf125c0db6a3de352b8602518d50f06385be26fe6d497b"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.20.2+ent/consul_1.20.2+ent_linux_arm64.zip"
    sha256 "866448a09a497ba10cccae49aad9c8bda68d4f751e27801a3dd8f78c5182cf88"
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
