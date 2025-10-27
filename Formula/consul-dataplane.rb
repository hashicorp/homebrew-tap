# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.9.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.9.0/consul-dataplane_1.9.0_darwin_amd64.zip"
    sha256 "6de12ba38e2a505c00a252d59b1a84d67b03078cd8302ab347a64d7660ecab93"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-dataplane/1.9.0/consul-dataplane_1.9.0_darwin_arm64.zip"
    sha256 "ca2cd1f631403e3d5c311fd3a7f9c62b3529ae14a5ab7122d5bea2dbc70a49e6"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/1.9.0/consul-dataplane_1.9.0_linux_amd64.zip"
    sha256 "48495ee1d0791b342d4de7bac149c5f430bf9f020c06f04f24f8bbc9bdad4f6d"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.9.0/consul-dataplane_1.9.0_linux_arm.zip"
    sha256 "675e5bf0b52db8962ae27b52d644e14f23ff48415be21da890356e1fe11505fb"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/1.9.0/consul-dataplane_1.9.0_linux_arm64.zip"
    sha256 "dad588374087b86ea226d69c302045555314eb8e61a05641f2954fd5e966d9a6"
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
