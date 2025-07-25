# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "1.8.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.8.0/consul-k8s_1.8.0_darwin_amd64.zip"
    sha256 "f09afc41484572a135d42f383caa7895c314425bc1a2d09ba7c1296b3034cd6f"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-k8s/1.8.0/consul-k8s_1.8.0_darwin_arm64.zip"
    sha256 "8c615556f3168f995a9a8ab73be87a2beb89b5940c9c447820b051433755e071"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.8.0/consul-k8s_1.8.0_linux_amd64.zip"
    sha256 "01fa6516c70dcc67e155fb0424d5ce90d9934daa787b8ad739fec667654c2098"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.8.0/consul-k8s_1.8.0_linux_arm.zip"
    sha256 "0a017282600ff0d83185b0d451cfaaaf923808fc9843743329e9fd54a3c31caa"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.8.0/consul-k8s_1.8.0_linux_arm64.zip"
    sha256 "71eeabde855b16c455864db62067f1b72b578aaa14ff5c10fa662d6dd94b55f7"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
