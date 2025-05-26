# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.7.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.7.1/consul-dataplane_1.7.1_darwin_amd64.zip"
    sha256 "cb4c31ffc6360a982f237d2b93cdebe54c0f0a38b0cf3e584c202d240ecb86c5"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-dataplane/1.7.1/consul-dataplane_1.7.1_darwin_arm64.zip"
    sha256 "1199d03740b6ec2cfb9e657a15a1a2dbb8c4f861984c0530fd9732cb95fea4a1"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.7.1/consul-dataplane_1.7.1_linux_amd64.zip"
    sha256 "4a522968a72612323aeae953f286ae013bdb2534add8d6ba335f735a4ac94dd0"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.7.1/consul-dataplane_1.7.1_linux_arm.zip"
    sha256 "05941f896ccbd332a317026884fff47dd633f194ec7496785e30629beac690bc"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.7.1/consul-dataplane_1.7.1_linux_arm64.zip"
    sha256 "15c269d680e5ef7b85d772ff6beb98342f19bd1d049a2af63847a1211b746aad"
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
