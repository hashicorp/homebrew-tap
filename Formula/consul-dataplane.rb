# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.5.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.5.0/consul-dataplane_1.5.0_darwin_amd64.zip"
    sha256 "8ac86a5d543442b54993c10c743331b20cdece045d99be26e2a611908b6003ee"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-dataplane/1.5.0/consul-dataplane_1.5.0_darwin_arm64.zip"
    sha256 "dff35269ebb5baf408c1b63a7fd8f545b58236cdcf90560a6665417276467fec"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.5.0/consul-dataplane_1.5.0_linux_amd64.zip"
    sha256 "94b2f0fdd7f8bd7ab112adafbc7edda8a6a1988c13482178871262c2464d229d"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.5.0/consul-dataplane_1.5.0_linux_arm.zip"
    sha256 "25047db84d49520f5818494b42ad2855f0f8d498eaba6087e0920e7b134a42d4"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.5.0/consul-dataplane_1.5.0_linux_arm64.zip"
    sha256 "8a6963618bc7fa0a1a5cbbd98ac764a3f08241c907535cbba509fe073759947f"
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
