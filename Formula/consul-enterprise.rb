# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "1.20.12+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.20.12+ent/consul_1.20.12+ent_darwin_amd64.zip"
    sha256 "4d116efb4f58baaedbe5681ade0dc4360f3e8927f436093cd70743ca3725572f"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.20.12+ent/consul_1.20.12+ent_darwin_arm64.zip"
    sha256 "dcf3ccf970bf9dee8553b6becfe3ee0c86292527dab6b080296fdfd5d2c1c420"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.20.12+ent/consul_1.20.12+ent_linux_amd64.zip"
    sha256 "c1f2d9a27b78c5782b7573c21ab0f5352af38a3d2d079e566107034fe28aa759"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.20.12+ent/consul_1.20.12+ent_linux_arm.zip"
    sha256 "83d2d96ab06a7cd415975860c86a55fa44b73fb9eab2122201489efc1a4014ae"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.20.12+ent/consul_1.20.12+ent_linux_arm64.zip"
    sha256 "6546a96dea34bd1715b00e6496fa6dc35de193804d04731754786c890728e392"
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
