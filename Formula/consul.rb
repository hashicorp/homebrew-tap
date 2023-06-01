# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Consul < Formula
  desc "Consul"
  homepage "https://www.consul.io"
  version "1.15.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.15.3/consul_1.15.3_darwin_amd64.zip"
    sha256 "9c9dea85bac9376ab6e121402afaf0a5748873b117fa2b13b01984961b589d8f"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.15.3/consul_1.15.3_darwin_arm64.zip"
    sha256 "6689163ded7cc897d41ae2002e5f1f840b2b62c6167a8f95c6f8123fb95c6f5c"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.15.3/consul_1.15.3_linux_amd64.zip"
    sha256 "86c6fe308d2e4eea106d21e20c307726eb87be87eab1f6dfb0d53db81b31d334"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.15.3/consul_1.15.3_linux_arm.zip"
    sha256 "6a6df60acf9a6d3a33f466a1cfd27cad76a171bf4efcc89939171f1314e67a3c"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.15.3/consul_1.15.3_linux_arm64.zip"
    sha256 "7c5eeaa4fa55166d5e8b8e52bb57f9e68e98d3f4f3b4e34fe6c3db783e506f72"
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
