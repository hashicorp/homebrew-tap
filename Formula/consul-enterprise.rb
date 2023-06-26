# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "1.16.0+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.16.0+ent/consul_1.16.0+ent_darwin_amd64.zip"
    sha256 "0be682d4441b5d3a5779b29f3f1d8a43283da8fdd58113e9b796c5256018049e"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.16.0+ent/consul_1.16.0+ent_darwin_arm64.zip"
    sha256 "37d9af36c0aca9ec419bf4a8027f94394ef6a3dff1df6e4d705ae5dfb5e1f0df"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.16.0+ent/consul_1.16.0+ent_linux_amd64.zip"
    sha256 "f71ede1daac8428da54f28dd98573a29c2806489314355244c90fa984b4fdfb0"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.16.0+ent/consul_1.16.0+ent_linux_arm.zip"
    sha256 "7e1ca3305bca1ef08b603ec665048a3d3ce94857cb962e15855152f04dbba3f9"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.16.0+ent/consul_1.16.0+ent_linux_arm64.zip"
    sha256 "2161cc8bd29820d2a0aedc8db6a8ebdd82f37998fe9e70b24708511f5a8e05c8"
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
