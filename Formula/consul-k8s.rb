# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "1.4.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.4.0/consul-k8s_1.4.0_darwin_amd64.zip"
    sha256 "4f910d6c59e25109b3121862b667cf57a6b6f89d8b5baf7374f34fccfd08b01d"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-k8s/1.4.0/consul-k8s_1.4.0_darwin_arm64.zip"
    sha256 "4cfe56376299ce06ea6dc17c5f8c58f13e552f4a8b425176e8a220927d12fdd0"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.4.0/consul-k8s_1.4.0_linux_amd64.zip"
    sha256 "978707f2641aab96cafe1d777151bc33f0ba69994b63d6bebecc0c0ee02a2080"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.4.0/consul-k8s_1.4.0_linux_arm.zip"
    sha256 "40b9ae701d367b951f4c4d1bb74a540092f7154682edc0d4513bcb0623c1d63b"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.4.0/consul-k8s_1.4.0_linux_arm64.zip"
    sha256 "848ada0a5303642460dcc4b430e5715288779d63ea717a62a1c5fd9d7db85225"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
