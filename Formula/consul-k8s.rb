# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "1.1.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.1.1/consul-k8s_1.1.1_darwin_amd64.zip"
    sha256 "75b8a3c5985acae83db143fe9f47f7044774b3d48d4541ddd5d679de5bec30f3"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-k8s/1.1.1/consul-k8s_1.1.1_darwin_arm64.zip"
    sha256 "68b72e9145d3436da60e31ae7d3ab604aac62b9f5bb5cab33e5055dcb4871a1f"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.1.1/consul-k8s_1.1.1_linux_amd64.zip"
    sha256 "8bacd3af97d0c8e407d9b1bd3ce2ca4b9c415d3a661444208c7c7c1c0fd7f370"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.1.1/consul-k8s_1.1.1_linux_arm.zip"
    sha256 "7bf7ed94e8e25996f0ed2830f9a18964eee96da0b09cf8507a83c44fbc20c29b"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.1.1/consul-k8s_1.1.1_linux_arm64.zip"
    sha256 "1c16906bede1b42f4adb4a57aa9a97df16c0ae9ecf38465e1ecc155ab9b7f208"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
