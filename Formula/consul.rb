# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Consul < Formula
  desc "Consul"
  homepage "https://www.consul.io"
  version "1.20.6"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.20.6/consul_1.20.6_darwin_amd64.zip"
    sha256 "0e7e4a96773bb003aa055580f71ec58ba0b4bee0bb517dcb626b296d1cb6683a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.20.6/consul_1.20.6_darwin_arm64.zip"
    sha256 "075759ed7005284037d8df2c35666bf0ca372be95fa93272abda09be50d43e5f"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.20.6/consul_1.20.6_linux_amd64.zip"
    sha256 "37fc6f213a44c6db3a2b912966fb1415939e9b189ce1bc1eb07b7f87449a28c2"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.20.6/consul_1.20.6_linux_arm.zip"
    sha256 "05272a1244f5814c084a224b86c5d8c0de4b743fb737496b9facb712ff2d6407"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.20.6/consul_1.20.6_linux_arm64.zip"
    sha256 "96ba60faadde5d92f36d536818a6382159344983c79529015e5d991fd1199d4b"
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
