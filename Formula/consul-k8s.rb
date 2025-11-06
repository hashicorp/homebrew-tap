# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "1.7.7"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.7.7/consul-k8s_1.7.7_darwin_amd64.zip"
    sha256 "0c4f0f329a0c579a727259d5bcf735cbabc6bd05947579f81e077483189134f4"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-k8s/1.7.7/consul-k8s_1.7.7_darwin_arm64.zip"
    sha256 "e0fb51f0afe62e7297b17b485aab74aab8e438a5c5e43a6b9e82783f5ac8d388"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.7.7/consul-k8s_1.7.7_linux_amd64.zip"
    sha256 "197160bca066405bbc25650d8e5275ca67e1c622c2216aad00e73816d45a2807"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.7.7/consul-k8s_1.7.7_linux_arm.zip"
    sha256 "f79767d988662235f7062efaf7a56234ff7fce5d6d2584f29d5899a80dd8fe11"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.7.7/consul-k8s_1.7.7_linux_arm64.zip"
    sha256 "286eab79200a858a291d3bc3bc1a2db8986f41dee04dba04d67647c7b9c6b54e"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
