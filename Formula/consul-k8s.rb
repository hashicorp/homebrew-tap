# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "1.5.0"

  if OS.mac? && Hardware::CPU.intel?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/consul-k8s/1.5.0/consul-k8s_1.5.0_darwin_amd64.zip"
    sha256 "9b7202367568388d4ae9b114576f9a4a1a97c68392e4583d8fbd756f79f3583c"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/consul-k8s/1.5.0/consul-k8s_1.5.0_darwin_arm64.zip"
    sha256 "de6d804d059cc90f77c1dd26dc7e3368107a18c93106f630e42a7d27b83ca7c7"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/consul-k8s/1.5.0/consul-k8s_1.5.0_linux_amd64.zip"
    sha256 "9618759e54d9b0add8fbed0bc3caa78c3f68db8830636e70b95efbe1047ae5ee"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/consul-k8s/1.5.0/consul-k8s_1.5.0_linux_arm.zip"
    sha256 "725b2e61a7685276c33669f0abadfc9575dd58d8a36c1fedfffe30ae7f26573c"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/consul-k8s/1.5.0/consul-k8s_1.5.0_linux_arm64.zip"
    sha256 "9f4b62d9c359c45bd4e4c80ee964e161cbe9e2e2ed4cd3106201854dc6985cc3"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
