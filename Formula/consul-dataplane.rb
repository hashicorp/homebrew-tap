# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.9.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.9.3/consul-dataplane_1.9.3_darwin_amd64.zip"
    sha256 "978087a151f8d2ec7815dbac87797036482aeb86b0f333e6f71e735dc4913656"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-dataplane/1.9.3/consul-dataplane_1.9.3_darwin_arm64.zip"
    sha256 "292a09d564a5faa3773ec5d0684b03b6a9a1a66c723a1c5f18b346055b75a75f"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.9.3/consul-dataplane_1.9.3_linux_amd64.zip"
    sha256 "80f5872aaa9315f83c3712465625b08ca0fbb4435770d5dbe764000ece222dbc"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.9.3/consul-dataplane_1.9.3_linux_arm.zip"
    sha256 "9d508b8a58002abf86284a0f583e6495c4e35f7c4f02c8ea3f6df28abe51bc62"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.9.3/consul-dataplane_1.9.3_linux_arm64.zip"
    sha256 "af64e15006b5cb06fc589a9858487139e5f7a23dfe8d7751d9e8d5a5458e4be3"
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
