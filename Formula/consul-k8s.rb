# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "1.7.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.7.1/consul-k8s_1.7.1_darwin_amd64.zip"
    sha256 "16c00bbb2b4a9e25126fb6698d96d94556130bb15fe1cbfa7965226d9e23d1d8"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-k8s/1.7.1/consul-k8s_1.7.1_darwin_arm64.zip"
    sha256 "c5a0231631aed462d79346b1ac9e7291359ffba9d09ffe1fa130c146472c5ddf"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.7.1/consul-k8s_1.7.1_linux_amd64.zip"
    sha256 "98728c794f8a4c4ec8fb7744df43b099c87e0b5be0233fbec761473519cf5b9b"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.7.1/consul-k8s_1.7.1_linux_arm.zip"
    sha256 "7ee52dbbd9a10de703efe721f4e81fb4e2014ecd3733f2e54ff279b60435da88"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.7.1/consul-k8s_1.7.1_linux_arm64.zip"
    sha256 "a5a3c11435bf90c9a42644d773cc67e95bc8e3a28b40949352349586966c708d"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
