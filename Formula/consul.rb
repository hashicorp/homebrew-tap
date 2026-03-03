# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class Consul < Formula
  desc "Consul"
  homepage "https://www.consul.io"
  version "1.22.5"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.22.5/consul_1.22.5_darwin_amd64.zip"
    sha256 "88028cf5c040a24193b2efd195efa6a6ca043c8340c7eb6b00343eecdf88ca40"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.22.5/consul_1.22.5_darwin_arm64.zip"
    sha256 "a728b166849ce51d107c22073c89217d27510dd9adad3326454273ac80ac2aef"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.22.5/consul_1.22.5_linux_amd64.zip"
    sha256 "58603b87fd085282f882fcd02b5165c93b321692514b2ab822dec8dd4cd028a3"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.22.5/consul_1.22.5_linux_arm.zip"
    sha256 "b3b5765fb2641111fbdae0f11ac77fa823f49fcd5e8121601811b1d322a93d87"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.22.5/consul_1.22.5_linux_arm64.zip"
    sha256 "e13bafeb1f5c11b16ca8087387a5ef5b6f7799018f91d5a0705c64c06c5ad61d"
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
