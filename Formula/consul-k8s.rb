# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "1.3.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.3.2/consul-k8s_1.3.2_darwin_amd64.zip"
    sha256 "822998bde3d7913ed0ed99e946f8003ac6743c69149a380db5fb7282989644db"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-k8s/1.3.2/consul-k8s_1.3.2_darwin_arm64.zip"
    sha256 "3fe4bc0c5eb6a54a95e520b6ea05aeb47082676a9800549cb78546af9062f98c"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.3.2/consul-k8s_1.3.2_linux_amd64.zip"
    sha256 "849d6f8c408d88e51d83d21b40edcb20b7efc06ba08cf82e98f1965ae6f5ab82"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.3.2/consul-k8s_1.3.2_linux_arm.zip"
    sha256 "bc6abe4b153f078ff907b7af20bdb8fc63db9a02d2a57f5664ff93469d1533fa"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.3.2/consul-k8s_1.3.2_linux_arm64.zip"
    sha256 "895eeafae90a5f81d8bd019433ccd9f75cecec20e79e0b437b01747abec2d1cd"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
