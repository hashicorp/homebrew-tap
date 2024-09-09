# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Consul < Formula
  desc "Consul"
  homepage "https://www.consul.io"
  version "1.19.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.19.2/consul_1.19.2_darwin_amd64.zip"
    sha256 "f677202c10cb8624bf2ede45f1a167de37f533c9674b08a9a3fb234af3ace415"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.19.2/consul_1.19.2_darwin_arm64.zip"
    sha256 "7b6ef9f49b7ef6043c8d932adcd2825cf4bfeab601c9b007fd60d4dac4370280"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.19.2/consul_1.19.2_linux_amd64.zip"
    sha256 "9315d95b19cf851f8fb0013b583ede6f61d591a9024a7dbb9b37eee45270abd2"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.19.2/consul_1.19.2_linux_arm.zip"
    sha256 "7c067813e01e68e9888b12de11bb1fc9f2d004a037935188e7a75040f5541083"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.19.2/consul_1.19.2_linux_arm64.zip"
    sha256 "aa5412eae966aa8e90c165c8558ff1f211850594ea6fe5505612985b05584a59"
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
