# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.8.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.8.0/consul-dataplane_1.8.0_darwin_amd64.zip"
    sha256 "9773e8afe900deaf6d296b514ab0b5c2ecc3aba14f6f0402b55161c43002cc33"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-dataplane/1.8.0/consul-dataplane_1.8.0_darwin_arm64.zip"
    sha256 "abafd3ddd0422540f1d39f88f6a3ce84a2cf98f4dc7ba6c9fd0d61fa7da68d8c"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.8.0/consul-dataplane_1.8.0_linux_amd64.zip"
    sha256 "7bea4e01ee661a9e854131431a7582a8ebf4377528f15fa99ee5ac9211d8399c"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.8.0/consul-dataplane_1.8.0_linux_arm.zip"
    sha256 "0bc6b1d1d3e3414eb1dd66007c6278dd0b7f238781127b8b6205049642634caa"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.8.0/consul-dataplane_1.8.0_linux_arm64.zip"
    sha256 "6be0cd29a2e2360f733762777f43af1fea92c9c5f4ee41d4744e21d2ac93e2a1"
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
