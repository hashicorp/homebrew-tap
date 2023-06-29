# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "1.2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.2.0/consul-k8s_1.2.0_darwin_amd64.zip"
    sha256 "a85efa75dd8545a9fd479deb5642abafb0693e3cb0da83c68d05519c430a9a18"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-k8s/1.2.0/consul-k8s_1.2.0_darwin_arm64.zip"
    sha256 "730f6bd776c40c1bff2338baf07dd3b55900fd8315945d37128a482b82d6ebb3"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.2.0/consul-k8s_1.2.0_linux_amd64.zip"
    sha256 "7db7e6d58f6fb3b065054b0690d845b97f82f13a6442e7e193028726a0506740"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.2.0/consul-k8s_1.2.0_linux_arm.zip"
    sha256 "bf2a93d61eb728ccd3cb7c6fb1d5e2516cc096f9b31dbc1a73b9cd521e8f89c8"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.2.0/consul-k8s_1.2.0_linux_arm64.zip"
    sha256 "62230d38d872c912f04b1d919106fc3f27e32554c4e30ea6905393d195c787ac"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
