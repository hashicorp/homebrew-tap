# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.5.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.5.1/consul-dataplane_1.5.1_darwin_amd64.zip"
    sha256 "30ab2a93e2fc562b603f497b6dc3943dcd410def59e0fa84e2798e9dbd26b71b"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-dataplane/1.5.1/consul-dataplane_1.5.1_darwin_arm64.zip"
    sha256 "faabadcc46746aa6acd80c4381394d143e949070d686d09eb03929cef365ee71"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.5.1/consul-dataplane_1.5.1_linux_amd64.zip"
    sha256 "8dbc0763f14498996b76aa23c48c168a984fb878d2a7ba28705c1e1468ffdf23"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.5.1/consul-dataplane_1.5.1_linux_arm.zip"
    sha256 "6c4421237bc7bb704773a15a2f8719281fa5e13e0cdfa0627d5d4498bb15f2a0"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.5.1/consul-dataplane_1.5.1_linux_arm64.zip"
    sha256 "3aed449f5e278ca4ccc52503f07b07b19fae501f0e4e31165d06fde658c005c3"
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
