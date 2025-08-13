# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Consul < Formula
  desc "Consul"
  homepage "https://www.consul.io"
  version "1.21.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.21.4/consul_1.21.4_darwin_amd64.zip"
    sha256 "3156e821b9d707fcb9dc85a26693e9c17b98e19585a3b0ed4df4e926abdee2ef"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.21.4/consul_1.21.4_darwin_arm64.zip"
    sha256 "dae25622ac91a2643dfc57365951fb6ce88aab244998329316b2eb9b9c94bf30"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.21.4/consul_1.21.4_linux_amd64.zip"
    sha256 "a641502dc2bd28e1ed72d3d48a0e8b98c83104d827cf33bee2aed198c0b849df"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.21.4/consul_1.21.4_linux_arm.zip"
    sha256 "168899974fece8703c4479d142ba66c68b5c4ea10cf1148d44774c6573d4a045"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.21.4/consul_1.21.4_linux_arm64.zip"
    sha256 "50a1b6467a038166684fee25b70ebe9d710e154bd5a179f3e07c655c829646ea"
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
