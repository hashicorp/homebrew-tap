# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Consul < Formula
  desc "Consul"
  homepage "https://www.consul.io"
  version "1.18.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.18.0/consul_1.18.0_darwin_amd64.zip"
    sha256 "def1a9b7a752e3d0908900991090df68ea5135c3ee0ea5c0300057cb8fa71953"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.18.0/consul_1.18.0_darwin_arm64.zip"
    sha256 "b88559a2a21476059fe5e2cb5ca95119c2c9fe4743cb98ade8f523bd00502a82"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.18.0/consul_1.18.0_linux_amd64.zip"
    sha256 "5d1fdc852b35dc94efe73cf52ba60c775248c7c9362bb684c94fcdb4118ae508"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.18.0/consul_1.18.0_linux_arm.zip"
    sha256 "c2244bead96b2b6bf0652f5f2c37589027141153925d8a0498fde17a0cd679a3"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.18.0/consul_1.18.0_linux_arm64.zip"
    sha256 "e1dc655e1d868bdcd1e3ceb33eec1f193902c46704d5f5ee9cbd5f10cfd5da9b"
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
