# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "1.21.0+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.21.0+ent/consul_1.21.0+ent_darwin_amd64.zip"
    sha256 "ebb3be7ee2ecc5d3f150fbb1b212abc84e192ebaf94a1c9f1896dbb5d9d578f0"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.21.0+ent/consul_1.21.0+ent_darwin_arm64.zip"
    sha256 "f5889f92cbbb56ab47f57900d89427803a7cfda6c9692e09d96e5c97ca2a5091"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.21.0+ent/consul_1.21.0+ent_linux_amd64.zip"
    sha256 "9148cf6bd68907e20c5683dbc0b4d76ac044a7c967054b49d2213c3d35f52394"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.21.0+ent/consul_1.21.0+ent_linux_arm.zip"
    sha256 "fd9708bd58c0a21049a599741f344365a726f854b7b5946bf3ffd945e64c2723"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.21.0+ent/consul_1.21.0+ent_linux_arm64.zip"
    sha256 "76c6db5341fd551772a2ceba7f8fd3407ea6e70e676f8c279ad78c80645126b0"
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
