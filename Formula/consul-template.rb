# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulTemplate < Formula
  desc "Consul Template"
  homepage "https://github.com/hashicorp/consul-template"
  version "0.33.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.33.0/consul-template_0.33.0_darwin_amd64.zip"
    sha256 "b9b78faa3713c274d54a941fd5fbb290e749486d7638e95b98933a32579e5f68"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-template/0.33.0/consul-template_0.33.0_darwin_arm64.zip"
    sha256 "9f370e5209c890fb32504e794812a3fe7faa64b7c65ad187020dbd7cc36ace7c"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.33.0/consul-template_0.33.0_linux_amd64.zip"
    sha256 "eea287d363e52894d4698f40b0ac667d57443b20e3317792ec2aca0161fd6c81"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.33.0/consul-template_0.33.0_linux_arm.zip"
    sha256 "6ef6caa4cd144809c779b278827c2e007695d1d27346038cf0b6eec51a7de1b6"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.33.0/consul-template_0.33.0_linux_arm64.zip"
    sha256 "8a1392135df57b27f08b7c543676124f79a83d1206867710f364bf876fe2c3c5"
  end

  conflicts_with "consul-template"

  def install
    bin.install "consul-template"
  end

  test do
    system "#{bin}/consul-template --version"
  end
end
