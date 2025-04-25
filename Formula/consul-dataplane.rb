# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.6.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.6.4/consul-dataplane_1.6.4_darwin_amd64.zip"
    sha256 "66eda7dca9214dc9a4b9cc372d4812e344c13cbb41c8e5068ae8efd47b0cd88b"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-dataplane/1.6.4/consul-dataplane_1.6.4_darwin_arm64.zip"
    sha256 "4d725b2b0c1f206106d5902fb5ca79ce64f7d645d676c49b83564892e835ea85"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.6.4/consul-dataplane_1.6.4_linux_amd64.zip"
    sha256 "745978f22eceb42d506bce1e23c7fa2c2822d85003beb02564d9e99a96579bba"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.6.4/consul-dataplane_1.6.4_linux_arm.zip"
    sha256 "3fba0ac1dc5d0db69c5551401e4ae90a709f39e968e3fc2a2544164265e46b34"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.6.4/consul-dataplane_1.6.4_linux_arm64.zip"
    sha256 "ca317c4b63f08d521c133c16126cea1a0b07e2c5049b4b82f01bddf1cef0a262"
  end
  
  depends_on "envoy" => :recommended

  conflicts_with "consul-dataplane"

  def install
    bin.install "consul-dataplane"
  end

  test do
    system "#{bin}/consul-dataplane --version"
  end
end
