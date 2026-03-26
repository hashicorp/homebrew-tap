# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.9.6"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.9.6/consul-dataplane_1.9.6_darwin_amd64.zip"
    sha256 "55ae1f013bd7108e4cac0846d8b8bc30352643d0342dbd7a02757f17927c3fa2"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-dataplane/1.9.6/consul-dataplane_1.9.6_darwin_arm64.zip"
    sha256 "f8eb8972840017619ff2af59f2f2522c0e5cfe87e7a53d49206a9fe63655200c"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.9.6/consul-dataplane_1.9.6_linux_amd64.zip"
    sha256 "c9eb77f022d9df45eac6de02f9692168fc48f181067c0c7e14b5dcbefbbaeeaa"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.9.6/consul-dataplane_1.9.6_linux_arm.zip"
    sha256 "f399b8710e785afeb2c9d2e331f561bce458ab14e4af93095d9ae75b4f150f70"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.9.6/consul-dataplane_1.9.6_linux_arm64.zip"
    sha256 "ec796d1b2a4852813d12eca64d5f7978ee21d3ad1f46e735a68a8cd57df6542c"
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
