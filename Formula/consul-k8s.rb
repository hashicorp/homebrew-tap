# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "1.9.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.9.1/consul-k8s_1.9.1_darwin_amd64.zip"
    sha256 "26d58e9666ae0617dbe8750950dac8f4856454416d310d45ccf6370a4d8b7c01"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-k8s/1.9.1/consul-k8s_1.9.1_darwin_arm64.zip"
    sha256 "4107c341f541f262b1b95f2b3225f62389df296785b7cff3865c089fc17b4bd9"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.9.1/consul-k8s_1.9.1_linux_amd64.zip"
    sha256 "ff112c8fde22f884ac97be381f6f33896d218d13e14630d56fb7a6c2ec356ed4"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.9.1/consul-k8s_1.9.1_linux_arm.zip"
    sha256 "b252e70ac8bb2866eb9a1679a7724e43c278581905ed8b310e3aab3ce661ba8b"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.9.1/consul-k8s_1.9.1_linux_arm64.zip"
    sha256 "b9eef9ddad6ca88350b81ccebc315e12c0500c60a364380e778579232b7e1102"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
