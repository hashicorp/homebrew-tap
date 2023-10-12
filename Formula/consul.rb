# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Consul < Formula
  desc "Consul"
  homepage "https://www.consul.io"
  version "1.16.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.16.2/consul_1.16.2_darwin_amd64.zip"
    sha256 "47fef801a90ddc32f483141e952723a6e9819edcd9bc9d7f88c1d5d3964b2b6d"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.16.2/consul_1.16.2_darwin_arm64.zip"
    sha256 "39a1a07f93f7d37ecf7821cadb117a4071ea704698948bf79f4a61cfcee316ab"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.16.2/consul_1.16.2_linux_amd64.zip"
    sha256 "2c87fffbb8abb3ba776519514db659f174a7c5b65faad7818457049ca9ff338b"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.16.2/consul_1.16.2_linux_arm.zip"
    sha256 "191a94dd2929f92d885ae0b6ff8a6b987ec6e3a5b15057c21a7b6279a407ae53"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.16.2/consul_1.16.2_linux_arm64.zip"
    sha256 "1903a5ecb6e17437bb6e0ada5e9ef403fd791ec1130c52cd76508260c4a2a719"
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
