# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "1.19.0+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.19.0+ent/consul_1.19.0+ent_darwin_amd64.zip"
    sha256 "63aa035bad22ffce0fff1bd9f4c80ceef970afc53b004ec0fa810cebc4eb19a3"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.19.0+ent/consul_1.19.0+ent_darwin_arm64.zip"
    sha256 "b0ec9960f1af3351918bbaa58787fe434121c4b1d9248536ec53423f5c8f904c"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.19.0+ent/consul_1.19.0+ent_linux_amd64.zip"
    sha256 "e583b6ef4b93fbb66d57248ae4da7f842fbe1171d6c37679cc93005d872a8765"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.19.0+ent/consul_1.19.0+ent_linux_arm.zip"
    sha256 "cbf82ec50088649b4439a333829ada2e75200b0b9c5fafed8e133d988dfa0d0c"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.19.0+ent/consul_1.19.0+ent_linux_arm64.zip"
    sha256 "081a47431dcb7f314818901fe268d155df3d2a50ae519c445918c003eae7de7d"
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
