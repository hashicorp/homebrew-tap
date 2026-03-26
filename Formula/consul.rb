# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class Consul < Formula
  desc "Consul"
  homepage "https://www.consul.io"
  version "1.22.6"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.22.6/consul_1.22.6_darwin_amd64.zip"
    sha256 "fc9c25898282f51e8e9b1a50f5f77bfbd0ae8556882fbf4338fa9f5f66b68a3c"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.22.6/consul_1.22.6_darwin_arm64.zip"
    sha256 "6a9b1e76ef814ee0abb9a414fcc83f15c3c7d60ac93d1516fe4e0b41a3613ee9"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.22.6/consul_1.22.6_linux_amd64.zip"
    sha256 "5c2d67c6a364512b3dd0646eaf8bb58fa2fd6b9c890e2f374475deab2a6ec648"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.22.6/consul_1.22.6_linux_arm.zip"
    sha256 "693c45efce71532906d3c29b02fded3900a7d4e692ce128d5e4c56cee4107184"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.22.6/consul_1.22.6_linux_arm64.zip"
    sha256 "a760371111ff3e1f0813672b240f833077f73c13ea37e75abc223ede534100b6"
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
