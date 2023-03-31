# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Consul < Formula
  desc "Consul"
  homepage "https://www.consul.io"
  version "1.15.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.15.2/consul_1.15.2_darwin_amd64.zip"
    sha256 "2f7aa68ffa4366a768219ef81b70077726b50069748a4943253b4f862b9b7c95"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.15.2/consul_1.15.2_darwin_arm64.zip"
    sha256 "199c4b6938c419f527556d1a18521e5779fd03ca121866097166c0c41b84bfc0"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.15.2/consul_1.15.2_linux_amd64.zip"
    sha256 "21e6c204f8dfdfde63eed5853fbf5a84d414299a111ad6b66da36d00db6414e9"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.15.2/consul_1.15.2_linux_arm.zip"
    sha256 "601f2db33601f091576816b9640984d7fb37a74b1234d500907e78482cdc0784"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.15.2/consul_1.15.2_linux_arm64.zip"
    sha256 "59ab286c72c8a0e9665460cc47020f87eb528a7d325216ec8f0573d80bd6bb80"
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
