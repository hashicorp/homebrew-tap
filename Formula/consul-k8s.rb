# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "1.9.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.9.2/consul-k8s_1.9.2_darwin_amd64.zip"
    sha256 "8f21153709950091d5118edf163e65577984c90502552e11c687ed727049cb4b"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-k8s/1.9.2/consul-k8s_1.9.2_darwin_arm64.zip"
    sha256 "45390a600dec63025c1bb2cb125d153a596d9bc37b5b051109a5041d538c6abb"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.9.2/consul-k8s_1.9.2_linux_amd64.zip"
    sha256 "4f1b56b7e47ed780e60a74bdc0d82e5d88d96cc1adad72c1a408a63e27b94e66"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.9.2/consul-k8s_1.9.2_linux_arm.zip"
    sha256 "0ed80d5a29a8fb7c5de77b23ba4cd3f6845b865c3d13519f72402b2dca0b2296"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.9.2/consul-k8s_1.9.2_linux_arm64.zip"
    sha256 "3f0d026143f3cc9cb8c3fad1633b02abb5af29cdd18bcdcceb982441edf037cc"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
