# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "1.17.0+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.17.0+ent/consul_1.17.0+ent_darwin_amd64.zip"
    sha256 "1db68002ba0bb0b07073a4f4522746450fbeb2d3f84d00dfa051b0aa0e7ee281"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.17.0+ent/consul_1.17.0+ent_darwin_arm64.zip"
    sha256 "2e5891e7f9062e2ccae7b46b95dbb227d6c40367de6690d94baf65ceb0a4dfb2"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.17.0+ent/consul_1.17.0+ent_linux_amd64.zip"
    sha256 "5c8a23e9893b9c115859a41615f6a3d07799ed98a99d4c37c5426f2be964ebb0"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.17.0+ent/consul_1.17.0+ent_linux_arm.zip"
    sha256 "8fa9460d09299d79d32afa915902d358f1e61186fc4ccf77b6f714d9d60ad245"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.17.0+ent/consul_1.17.0+ent_linux_arm64.zip"
    sha256 "a6fd345508c7fd9f1d5495f326902df6be2bc6a0ca10a8890e931f1e87df3f3f"
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
