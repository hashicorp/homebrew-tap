# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "1.9.6"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.9.6/consul-k8s_1.9.6_darwin_amd64.zip"
    sha256 "fe59108cb6a837e5dc554c4145a650410a593da21a9614476f51b2e32de80411"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-k8s/1.9.6/consul-k8s_1.9.6_darwin_arm64.zip"
    sha256 "c803fee90706c1acd6ed6521e7e4869f3c17190ff12024f2c2216b955bb86d6d"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.9.6/consul-k8s_1.9.6_linux_amd64.zip"
    sha256 "09f266505f1ee3d7013c1a07d1180cccbfd65efa3251d8b5b4b90a319e94bf7d"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.9.6/consul-k8s_1.9.6_linux_arm.zip"
    sha256 "e2966731699343655b2703906d5778a0dc25ef42d2c8aa8324f5698f21cb4803"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.9.6/consul-k8s_1.9.6_linux_arm64.zip"
    sha256 "fa602f0c6045981c07177a7292b3595a24669576ff9af71808e024e0278241d0"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
