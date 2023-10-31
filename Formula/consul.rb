# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Consul < Formula
  desc "Consul"
  homepage "https://www.consul.io"
  version "1.16.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.16.3/consul_1.16.3_darwin_amd64.zip"
    sha256 "41c0a5021b206bad915074dec383bb806725640b2c818fda140d0616b4e89546"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.16.3/consul_1.16.3_darwin_arm64.zip"
    sha256 "290a53459d9719a9e31eebdb1fe99953b2811b969a432ba82c0e38fd01a10bdd"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.16.3/consul_1.16.3_linux_amd64.zip"
    sha256 "9d0d7ad123844d43543d285cc0b3e15393d75ffa384bf84e5d64226a7f3d3132"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.16.3/consul_1.16.3_linux_arm.zip"
    sha256 "67407220ee72650e14fecc49fe9f95f10faf9e422fdc478d5cc0e7812a6d34f4"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.16.3/consul_1.16.3_linux_arm64.zip"
    sha256 "349d1a996349ee496d389464884a10bf0899bd46b2820bf6fc1dc29c49caa50b"
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
