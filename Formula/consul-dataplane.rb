# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.2.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.2.2/consul-dataplane_1.2.2_darwin_amd64.zip"
    sha256 "d9942976595c365403d0c0c987c0ab90d430cbd8a3052905ac9ccfa33a5e3b5a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-dataplane/1.2.2/consul-dataplane_1.2.2_darwin_arm64.zip"
    sha256 "2b61b5cf2bc40bed0d47d3ac5c23d77aa8ec12ce52c45751d8bb9cb857f18c5d"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.2.2/consul-dataplane_1.2.2_linux_amd64.zip"
    sha256 "80e8d1fe00b16ebde6a01aef936c11289ef0477c8fcf035b48bdc63124b62728"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.2.2/consul-dataplane_1.2.2_linux_arm.zip"
    sha256 "6ac6bec6bd665fc4b7c90aa1b44420f4ba1624f322fac97ff9eceb4f631ba133"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.2.2/consul-dataplane_1.2.2_linux_arm64.zip"
    sha256 "05bd53dcedebf21c99363677c90043fce96387b194278518ad47f88bd059b486"
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
