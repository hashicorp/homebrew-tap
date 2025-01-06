# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Consul < Formula
  desc "Consul"
  homepage "https://www.consul.io"
  version "1.20.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.20.2/consul_1.20.2_darwin_amd64.zip"
    sha256 "9614e8fe436231e76a20ad6a58a906c2697221a188725591aaf15fd1edd8c918"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.20.2/consul_1.20.2_darwin_arm64.zip"
    sha256 "4ed71a82faa8f0e3c9c15718dc712ae377013bcb550186f1c07088c8670370df"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.20.2/consul_1.20.2_linux_amd64.zip"
    sha256 "1bf7ddf332f02e6e36082b0fdf6c3e8ce12a391e7ec7dafd3237bb12766a7fd5"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.20.2/consul_1.20.2_linux_arm.zip"
    sha256 "26431bf7b0443f30be7f5dc749f386d7fd9427d85794235afd12ecd5a5b03910"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.20.2/consul_1.20.2_linux_arm64.zip"
    sha256 "c06a1c82888f9e27962f42af89f6ebc860f07f7ced0793ded4325f9b2c875f8b"
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
