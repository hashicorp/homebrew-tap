# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "1.6.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.6.0/consul-k8s_1.6.0_darwin_amd64.zip"
    sha256 "94f487a5ebabd7f11430c5db8da92bae56fd7839b04a6457fbe05e9202e08a92"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-k8s/1.6.0/consul-k8s_1.6.0_darwin_arm64.zip"
    sha256 "4221f47828d36355e32215f6ccecbaabbce16c4a53a4d443c7f2f7f53162b0c4"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.6.0/consul-k8s_1.6.0_linux_amd64.zip"
    sha256 "6e2ff8c1b7d71e011deb77c8602df2f338ffcb8b0f331dd344c0073b328e08d3"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.6.0/consul-k8s_1.6.0_linux_arm.zip"
    sha256 "a0409e0b3abe529565c69e306dcd9b12a946abdf4e133e3d03f581630cffad1d"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.6.0/consul-k8s_1.6.0_linux_arm64.zip"
    sha256 "0720a3ef2d83fc9619d1010d8fdb9a04c0651519dd1359ef7bf4aebac34f2780"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
