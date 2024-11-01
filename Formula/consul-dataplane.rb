# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.6.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.6.1/consul-dataplane_1.6.1_darwin_amd64.zip"
    sha256 "efaa373ef815f97104c41fc1baaa4e7f96d25ecb8e40cf5a88c28d2e98a567b0"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-dataplane/1.6.1/consul-dataplane_1.6.1_darwin_arm64.zip"
    sha256 "fdb14a753d494359794d9b7e8b3e45a9f5aabdd401fcecc0eb61ab9b9a3cde46"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.6.1/consul-dataplane_1.6.1_linux_amd64.zip"
    sha256 "72be4b48bf0d05a6a4218b0dacb17c41d6e2fe3f69e741bbf3f181394f8f228f"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.6.1/consul-dataplane_1.6.1_linux_arm.zip"
    sha256 "17eaed9dece42c1e4764fb29c7252fcdc2d6e6c27806456a727f07f6e67a784f"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.6.1/consul-dataplane_1.6.1_linux_arm64.zip"
    sha256 "cef71ae93ff3b10d3a50a90a77a02f00f9d7a0f67cf12c082d8455d5d9d084e0"
  end
  
  depends_on "envoy" => :recommended

  conflicts_with "consul-dataplane"

  def install
    bin.install "consul-dataplane"
  end

  test do
    system "#{bin}/consul-dataplane --version"
  end
end
