# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "1.1.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.1.2/consul-k8s_1.1.2_darwin_amd64.zip"
    sha256 "1d235b9d7130ac31492cbd747ff87c05b2ee27fab20c97619a02a63f005d5495"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-k8s/1.1.2/consul-k8s_1.1.2_darwin_arm64.zip"
    sha256 "631d9ec6a6ba6de4002f18ddd15fac64911665372e7023969565aca70bedebcc"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.1.2/consul-k8s_1.1.2_linux_amd64.zip"
    sha256 "c7854131ae8850e1b2e06b77bcda091cad2ea0182f60ed0f27ff261fccb2e12c"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.1.2/consul-k8s_1.1.2_linux_arm.zip"
    sha256 "9da2ad3225c2e38fac3e83640fafc82ad16fefc5cda309affcebf78f7c58e65d"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.1.2/consul-k8s_1.1.2_linux_arm64.zip"
    sha256 "fb8ee477a9f277b58aff198070b3874f53a3073ca41c7f20872c0616590f34c7"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
