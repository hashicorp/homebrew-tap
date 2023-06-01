# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.1.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.1.2/consul-dataplane_1.1.2_darwin_amd64.zip"
    sha256 "8ec0019d78ca212c3f2531c2fcde07bbdd8c0befacb1cb7745baba516c7e78cd"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-dataplane/1.1.2/consul-dataplane_1.1.2_darwin_arm64.zip"
    sha256 "6b72edb705fa2dd2e3a1c4be72d549249c9c26b0c2c0fb1745cb7840e6836593"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.1.2/consul-dataplane_1.1.2_linux_amd64.zip"
    sha256 "484008164cf9be28fb8ff217fa36cd1c5614c775d9ed9b7cb930bc2d09802179"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.1.2/consul-dataplane_1.1.2_linux_arm.zip"
    sha256 "be78eb3d64dd8fbf5c853ac5135dbae243bcbf58037e93f03bd459fbb2fed09c"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.1.2/consul-dataplane_1.1.2_linux_arm64.zip"
    sha256 "e01a63ac73437bf90f52d1289bbb479ab2e6c42719040c0155e3599c0a3c2011"
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
