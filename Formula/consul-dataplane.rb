# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.8.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.8.3/consul-dataplane_1.8.3_darwin_amd64.zip"
    sha256 "9760faab8dfc46a3a3da0005eaf06f8715c8e12da5f3c5bb54ea86c16f59a214"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-dataplane/1.8.3/consul-dataplane_1.8.3_darwin_arm64.zip"
    sha256 "8c156de8dbaec75248d58f60532cd256db07e65ba201bb1a1c10a99be1880ec0"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.8.3/consul-dataplane_1.8.3_linux_amd64.zip"
    sha256 "00c185f3c62cb2ddded9b3a378e15371d39019de0b30950cf0b4695b91d19f38"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.8.3/consul-dataplane_1.8.3_linux_arm.zip"
    sha256 "97e999fbf2ef28b4833e874da5cb7ebfcaf4b59f5443ce364b207f151bd0221e"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.8.3/consul-dataplane_1.8.3_linux_arm64.zip"
    sha256 "42a903ea887e69dedeca31152a30137e855bb872f17dac22fe361a90b09f3662"
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
