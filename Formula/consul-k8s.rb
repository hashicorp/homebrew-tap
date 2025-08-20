# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "1.8.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.8.1/consul-k8s_1.8.1_darwin_amd64.zip"
    sha256 "efc4d1fbe88af3e95a0cc8d2d9783d8ebc7be352f71b4c36fd51c47d46f47108"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-k8s/1.8.1/consul-k8s_1.8.1_darwin_arm64.zip"
    sha256 "1cf1fed0b756bf9b4f19c54b233d123174399f0e0dcb0c27a574c965e4a0c6f6"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.8.1/consul-k8s_1.8.1_linux_amd64.zip"
    sha256 "0a985154bc3161092e18f1d2e8195f6bc41699bfda84cf0d5860b986ae03094b"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.8.1/consul-k8s_1.8.1_linux_arm.zip"
    sha256 "d8f820fc6ff5d306b6b7f5fa549e9dcc315211b17b75a54f3c63f2f3c595cf50"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.8.1/consul-k8s_1.8.1_linux_arm64.zip"
    sha256 "0b6c7917092b20d194b7f775ca826283c8e771440dde40797a143ab6c5514018"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
