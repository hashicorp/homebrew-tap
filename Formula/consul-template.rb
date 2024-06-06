# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulTemplate < Formula
  desc "Consul Template"
  homepage "https://github.com/hashicorp/consul-template"
  version "0.38.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.38.1/consul-template_0.38.1_darwin_amd64.zip"
    sha256 "d278198825bbcc60e5cf9523b2909b8761ce67aef704ff14e4f602f04ede22c7"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-template/0.38.1/consul-template_0.38.1_darwin_arm64.zip"
    sha256 "f40be7f44456e3ad39decf57dda0232b86291d3bc68643ee9a467261aa3610ab"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.38.1/consul-template_0.38.1_linux_amd64.zip"
    sha256 "0014faa80000b767802643c34689852a3de80616dac4770a765d0073bb44a892"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.38.1/consul-template_0.38.1_linux_arm.zip"
    sha256 "3e0eccf9ed9a8be2cf070e02534391c7f98c87840d85dc4e9adccc6b0428207e"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.38.1/consul-template_0.38.1_linux_arm64.zip"
    sha256 "a3a7f004e159f42680398d03055413d9a81e69b66d8d437130c0e977caed1c78"
  end

  conflicts_with "consul-template"

  def install
    bin.install "consul-template"
  end

  test do
    system "#{bin}/consul-template --version"
  end
end
