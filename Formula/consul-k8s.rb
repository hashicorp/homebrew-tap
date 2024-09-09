# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "1.5.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.5.3/consul-k8s_1.5.3_darwin_amd64.zip"
    sha256 "22e84cad8baadff363a3cff3f5f819b05c6c93095df4d17631c977742acc8169"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-k8s/1.5.3/consul-k8s_1.5.3_darwin_arm64.zip"
    sha256 "564cb35fc9aeecdc78fff3af68891e5607a1a69d7148d4f51c0b4ec6acf4d5d5"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.5.3/consul-k8s_1.5.3_linux_amd64.zip"
    sha256 "ec27453bc46f7719a66e66600538aaa005b4b00dd7fe9084d4aa745e96418f8b"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.5.3/consul-k8s_1.5.3_linux_arm.zip"
    sha256 "e0d41c0ba488a9882e90f1093d39054dcda0f5b94134b0f263553f13cabf2e0d"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.5.3/consul-k8s_1.5.3_linux_arm64.zip"
    sha256 "1b8ad9a93c1ca902cff87751f889b6c801cc2773cc25e7ec399aa07e0ad691b9"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
