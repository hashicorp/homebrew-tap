# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "1.2.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.2.3/consul-k8s_1.2.3_darwin_amd64.zip"
    sha256 "7143d1f62d91edb4c9c95c0e5f2489eafc02092b2ee8b51bc21f913acacd3086"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-k8s/1.2.3/consul-k8s_1.2.3_darwin_arm64.zip"
    sha256 "c8978d67c2c495e3fb6443b78c129379e97e1d68bdd5e5fbb8c57a67d605e6e7"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.2.3/consul-k8s_1.2.3_linux_amd64.zip"
    sha256 "3f4de34682f9e3089e02b75f389ff5d4f8552dce8f217776b33d983903f3ebc7"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.2.3/consul-k8s_1.2.3_linux_arm.zip"
    sha256 "53ed261072bf3879893218a4feca9ba003163f3ea955e1caa9e3d10d7d2a70cf"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.2.3/consul-k8s_1.2.3_linux_arm64.zip"
    sha256 "38a7b7547febd92d782e40bc9cf5d0ee6805c8207f80b8e421ddd188a964a919"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
