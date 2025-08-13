# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "1.21.4+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.21.4+ent/consul_1.21.4+ent_darwin_amd64.zip"
    sha256 "7d6b24b262da3c3a8e646202d6841d12e432ccbd4aaec91fc86c63aeb5186170"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.21.4+ent/consul_1.21.4+ent_darwin_arm64.zip"
    sha256 "f6bde04407f1cdf5d9722159d75f67d43e99c2fdd38186885c1de913ed7568cc"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.21.4+ent/consul_1.21.4+ent_linux_amd64.zip"
    sha256 "48d960983f30ea9d9737f25697751948218a47252a6ce44408dc3a44b290b39c"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.21.4+ent/consul_1.21.4+ent_linux_arm.zip"
    sha256 "34bd9172ccd09a5f4b00768f7ac5482d338f24c99639558884e587c8bfb9414e"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.21.4+ent/consul_1.21.4+ent_linux_arm64.zip"
    sha256 "4afe266646fb3d62f0463533de95a6870060c96c48239984bdc6306f509c4ab2"
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
