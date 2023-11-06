# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.3.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.3.0/consul-dataplane_1.3.0_darwin_amd64.zip"
    sha256 "e35d5ae036b1a5f463fead0395cf3c8ee434d5cca3268d5b2f86daaa07524a7f"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-dataplane/1.3.0/consul-dataplane_1.3.0_darwin_arm64.zip"
    sha256 "e33077242c0882c33005b36276c754d4af68138646418a473251a8973e956c43"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.3.0/consul-dataplane_1.3.0_linux_amd64.zip"
    sha256 "c68f4b95d86344b74357438bf612ee734f0adf044c40d42b274545f112593d33"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.3.0/consul-dataplane_1.3.0_linux_arm.zip"
    sha256 "b7a6beec21699115df4d3b0c4b6429e5cf083b354ce13d6e827a6475298d2bfd"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.3.0/consul-dataplane_1.3.0_linux_arm64.zip"
    sha256 "bec16bd8a3df64e309cb409a8263875ee1f7b6370a11618f26e91da02e1a4e0a"
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
