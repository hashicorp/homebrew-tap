# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "1.7.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.7.0/consul-k8s_1.7.0_darwin_amd64.zip"
    sha256 "c42d1a57b973a57e0ef8724c9fd91a9fefd427ecbf6d702467d651ebbf91b095"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-k8s/1.7.0/consul-k8s_1.7.0_darwin_arm64.zip"
    sha256 "9751486b8d4acd381143c837ba34e6c95ea2cd2a007b972d8daa24e640bb2393"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.7.0/consul-k8s_1.7.0_linux_amd64.zip"
    sha256 "89de2bab01eca7590c44cdb57baaec997cd094f2063cef1ffa2f0f1cd2aa775f"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.7.0/consul-k8s_1.7.0_linux_arm.zip"
    sha256 "160fe8007a3f191fd580605291d3e261d62e249ac073cce8bdbd35ab089d8123"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.7.0/consul-k8s_1.7.0_linux_arm64.zip"
    sha256 "52e250bcd2e7555db7e10071683b5bc9931e87944a8d31ab23f993e9591404d2"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
