# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "1.2.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.2.2/consul-k8s_1.2.2_darwin_amd64.zip"
    sha256 "303165dad51150d72d10a42b3c23d220780770ea07306d3d18855dfefe587593"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-k8s/1.2.2/consul-k8s_1.2.2_darwin_arm64.zip"
    sha256 "a614fc0cda1ca790e7f4167bb6d9d9952a5d3c4ac551bcaf3d088c7c17279637"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.2.2/consul-k8s_1.2.2_linux_amd64.zip"
    sha256 "1b4e328a8a4c3d2f0f2f3a1733a71ea304d19631b42d511a7a7c3be3c3a1bc18"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.2.2/consul-k8s_1.2.2_linux_arm.zip"
    sha256 "8bd4d585e2ea09af3199b853ade9ec5adfd2517a664c05a45642f064a3d00803"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.2.2/consul-k8s_1.2.2_linux_arm64.zip"
    sha256 "1352c0297466c2e419dac36a8893fb450e3bec732918dd68bded6b6a4ee60687"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
