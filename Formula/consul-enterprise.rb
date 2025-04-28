# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "1.20.6+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.20.6+ent/consul_1.20.6+ent_darwin_amd64.zip"
    sha256 "19ffe9e38de5c43aea75e2438b796fb80b4306666dfc2dbcd4261e369bedc83d"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.20.6+ent/consul_1.20.6+ent_darwin_arm64.zip"
    sha256 "4b8841fa481952493aa07756b86e2e886991e9fad1a43b5309a11d7826cccf8f"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.20.6+ent/consul_1.20.6+ent_linux_amd64.zip"
    sha256 "ab62d64d0d32dd54d11888697ecc293636b54683701c3e527aab62b397a6c297"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.20.6+ent/consul_1.20.6+ent_linux_arm.zip"
    sha256 "d351d121f1b5707aab198928f6d025bb302c9c3c812fcd0ee51aaffa120ddeee"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.20.6+ent/consul_1.20.6+ent_linux_arm64.zip"
    sha256 "59199c02b97563792e35cf1bf0e682294d61383d62a98d5596a6eb5b2082ecfd"
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
