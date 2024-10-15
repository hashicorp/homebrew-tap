# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.6.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.6.0/consul-dataplane_1.6.0_darwin_amd64.zip"
    sha256 "0a712932f6f64501f6e90af71ac336e838249c8bb2390f5dcda9c7b40fa5be09"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-dataplane/1.6.0/consul-dataplane_1.6.0_darwin_arm64.zip"
    sha256 "84686f679b44a69466d787bc63f8651d73d948a816552a5413c543c9cee5f49c"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.6.0/consul-dataplane_1.6.0_linux_amd64.zip"
    sha256 "b70c2831a5d90006aed9bcb5ed6aa8e87e4d93f5f173f003c57553b128cba1d1"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.6.0/consul-dataplane_1.6.0_linux_arm.zip"
    sha256 "b8dd7ead48ab6268ee3fd9ca9235c320f2232802a1114561b550efa2a3a596d8"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.6.0/consul-dataplane_1.6.0_linux_arm64.zip"
    sha256 "a192745e48a1ed45cc2f7d3d6ecfbaa476d2209c0c96099f59eeef0b62fb8196"
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
