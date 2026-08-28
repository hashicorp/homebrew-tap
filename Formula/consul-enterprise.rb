# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "2.0.3+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/2.0.3+ent/consul_2.0.3+ent_darwin_amd64.zip"
    sha256 "521b9e881a6cd478dab2d8318df287316761bd4f22d7670017a5ad22956fc76c"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/2.0.3+ent/consul_2.0.3+ent_darwin_arm64.zip"
    sha256 "5c4baf96610d3efb318c23da1fb8f54ce1a76d623ff5b94452c342e5db42c102"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/2.0.3+ent/consul_2.0.3+ent_linux_amd64.zip"
    sha256 "7e5f5212ac898215813ad1f437988a2ca8a452032da2158a7ad4265e34d1fe10"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/2.0.3+ent/consul_2.0.3+ent_linux_arm.zip"
    sha256 "cd2edc499e0796841d9983a493cd377429c183421e06501f87c1d1e21555a9f1"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/2.0.3+ent/consul_2.0.3+ent_linux_arm64.zip"
    sha256 "bd23b095dfbbaf294f2e9c4d7d8c4691ad53046a56fad0e9fd0dfc0887a1b2df"
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
