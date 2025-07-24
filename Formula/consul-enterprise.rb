# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "1.21.3+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.21.3+ent/consul_1.21.3+ent_darwin_amd64.zip"
    sha256 "0fba37c59999eb6aada8255fbbacff8727d66e5edbf857de4c5cbe30678c502e"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.21.3+ent/consul_1.21.3+ent_darwin_arm64.zip"
    sha256 "8d5cab8255aefda40d70fab06c956d5729e5950348f926f2916580f11be3347c"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.21.3+ent/consul_1.21.3+ent_linux_amd64.zip"
    sha256 "25550901c927bfc2942ed1d9fa1a9ba1bb46b4c8acf5fd1c99abefa1f3887f48"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.21.3+ent/consul_1.21.3+ent_linux_arm.zip"
    sha256 "e35b3e62a1aa14c0f23cd5b659f1f333e4b247d927ea0d72e0a78e344f3359f8"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.21.3+ent/consul_1.21.3+ent_linux_arm64.zip"
    sha256 "dee6df6be372d587e864d9cf3e821d6e6b5d1e0d8e905fc98ce9f07fe7852418"
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
