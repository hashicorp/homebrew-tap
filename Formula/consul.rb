# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Consul < Formula
  desc "Consul"
  homepage "https://www.consul.io"
  version "1.17.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.17.0/consul_1.17.0_darwin_amd64.zip"
    sha256 "0dc639b59da9ce2acfd8767125ccc760c5d97b393e0659cac25505241510f002"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.17.0/consul_1.17.0_darwin_arm64.zip"
    sha256 "1c52abf65d9ba248534ddbfab57f5beea3659963c278fb0d7430f5ca705c3e92"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.17.0/consul_1.17.0_linux_amd64.zip"
    sha256 "4fbb6c3a05ddfc72d314149fe9765a1be89c33857b003a1d861469f2fe97e23e"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.17.0/consul_1.17.0_linux_arm.zip"
    sha256 "265e7134edb67aa00167c839fb73f5e410bd135ef7d0517ea810c07b46ffd652"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.17.0/consul_1.17.0_linux_arm64.zip"
    sha256 "a37ea9dd3eed18f58df6c83057fcdf9feafd100eeabb44bd217c80d60bf9f0d3"
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
