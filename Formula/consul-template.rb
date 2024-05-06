# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulTemplate < Formula
  desc "Consul Template"
  homepage "https://github.com/hashicorp/consul-template"
  version "0.37.6"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.37.6/consul-template_0.37.6_darwin_amd64.zip"
    sha256 "ce388f6d9e2d66937cb2a96f7594172a9a785e7a79d7950d3ef80115f3604010"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-template/0.37.6/consul-template_0.37.6_darwin_arm64.zip"
    sha256 "0588fb029bd87b389860fb0bf5ab43b62dff49060bf759d55d5a340d57da5d18"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.37.6/consul-template_0.37.6_linux_amd64.zip"
    sha256 "b28c97b954cdc04f8793ea233614054f39a30e6d81a6e957ed1c6bc864369f50"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.37.6/consul-template_0.37.6_linux_arm.zip"
    sha256 "005fb2ac17913ce820ebe3c2aefb7d2d748cda38974d6a9fb4fd1c6f9b30e002"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.37.6/consul-template_0.37.6_linux_arm64.zip"
    sha256 "b929cb684fb4ffb4ad57d63245df114af2b5ebc583607e892aac648b1ab1cb8a"
  end

  conflicts_with "consul-template"

  def install
    bin.install "consul-template"
  end

  test do
    system "#{bin}/consul-template --version"
  end
end
