# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Consul < Formula
  desc "Consul"
  homepage "https://www.consul.io"
  version "1.16.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.16.1/consul_1.16.1_darwin_amd64.zip"
    sha256 "04ce7f6818e5c5b6ab9494502a2ad2aec68ac8f097b713bbd220a245620c030f"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.16.1/consul_1.16.1_darwin_arm64.zip"
    sha256 "5e7a2f449750d779cc850042b384124a3df352ed268eab6f96325025f8768c42"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.16.1/consul_1.16.1_linux_amd64.zip"
    sha256 "1d48942fa9f1d0df3f56a1622c7a46e9b85924ed9976338912101bb5519aadf1"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.16.1/consul_1.16.1_linux_arm.zip"
    sha256 "9e83f0af50232fe036a8cc6e35b646ea4d8766b2c76c69cc700f9c9709363537"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.16.1/consul_1.16.1_linux_arm64.zip"
    sha256 "b949438fddc180825fe8917dd58ed80282b2ed4eea7c9f421ccec0c23cf77507"
  end

  conflicts_with "consul"

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
