# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.3.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.3.1/consul-dataplane_1.3.1_darwin_amd64.zip"
    sha256 "a44af7b835fb6ac440efdd936d78ddb36c9b4ef2dbe45d2c12ecf1bfc6fe3bef"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-dataplane/1.3.1/consul-dataplane_1.3.1_darwin_arm64.zip"
    sha256 "8ed782957d902abf2696f134785847f52e440c892b8d3a1abf36da3cc9d2ef8f"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.3.1/consul-dataplane_1.3.1_linux_amd64.zip"
    sha256 "3c030edca1d47a2051c12937a1c04c189f94cf6574c83ba4368ef42e710618c0"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.3.1/consul-dataplane_1.3.1_linux_arm.zip"
    sha256 "f28ed557863e3c7e3002298a1db931a9ac279391a66582290278cb129047818b"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.3.1/consul-dataplane_1.3.1_linux_arm64.zip"
    sha256 "715e82d28d23976702d9473563aee4221af28fdc6a01b9694afd4689780e54dd"
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
