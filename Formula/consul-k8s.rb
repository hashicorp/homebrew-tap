# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "1.4.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.4.2/consul-k8s_1.4.2_darwin_amd64.zip"
    sha256 "090c0841362b86ba5fd862d7ee7ded6b2a85f9ac779df9b2f4e98f17221286e8"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-k8s/1.4.2/consul-k8s_1.4.2_darwin_arm64.zip"
    sha256 "2db2d15a38f5b5e7cf0bcd0ebefaa49c307cc11bdeba4a405503fe721ae19cc0"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.4.2/consul-k8s_1.4.2_linux_amd64.zip"
    sha256 "fcc3b54fda250d35459b01452097d237788b73efe7ef0b1b0524fe766d7eddca"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.4.2/consul-k8s_1.4.2_linux_arm.zip"
    sha256 "d401eb0d3e3414b2144abe102fd54ddc92d7338ce58c5e547ded701259eff08c"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.4.2/consul-k8s_1.4.2_linux_arm64.zip"
    sha256 "fbae73a8dd96efed5c0ec43d940585bba7abc3c6bf913a0e1833d1eb0dd154a3"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
