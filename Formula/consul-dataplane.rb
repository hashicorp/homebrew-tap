# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.8.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.8.1/consul-dataplane_1.8.1_darwin_amd64.zip"
    sha256 "566508d147d4db4d81334faa5c4b80121ab121be12dff29acd797ce47aecf5ab"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-dataplane/1.8.1/consul-dataplane_1.8.1_darwin_arm64.zip"
    sha256 "bcf884573845534cc238f8b0ac73eac08f4084f05403cca08f72f3e4a2f7a3ec"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.8.1/consul-dataplane_1.8.1_linux_amd64.zip"
    sha256 "706179282487fcc0326afd9420611f240a747fe1faad643ead545a712d53ba3f"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.8.1/consul-dataplane_1.8.1_linux_arm.zip"
    sha256 "a1a28d50cb838d50a0f1702c4d51581e860f36fe730992b3b140c8b9f3bda07a"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.8.1/consul-dataplane_1.8.1_linux_arm64.zip"
    sha256 "3af49c26746e115922592a05e7bbb2433e951d317df6ac5dc6e1995bcd7a28f3"
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
