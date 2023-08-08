# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "1.16.1+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.16.1+ent/consul_1.16.1+ent_darwin_amd64.zip"
    sha256 "87adc902f312bc95534cb2890b3d915162b8b7d7f849cc49245e6403b57c6b8a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.16.1+ent/consul_1.16.1+ent_darwin_arm64.zip"
    sha256 "9629641080f02d7b87d50ac3d5a933a57b0607f8fac01f4c8e5078a1ea749615"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.16.1+ent/consul_1.16.1+ent_linux_amd64.zip"
    sha256 "3e68670d0d723363adea8e8edc89848d784e90e382b00294a0994b701cbc47f0"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.16.1+ent/consul_1.16.1+ent_linux_arm.zip"
    sha256 "74f66f09027e63c66f425a78124120e7e6d8aa6fe4844567a6ee0da8417b9c13"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.16.1+ent/consul_1.16.1+ent_linux_arm64.zip"
    sha256 "e85da5ac98a1c5dcaddbebc126c807e5c1171443f45090bf5617755fe6472eed"
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
