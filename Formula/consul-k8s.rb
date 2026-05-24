# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "2.0.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/2.0.0/consul-k8s_2.0.0_darwin_amd64.zip"
    sha256 "ba2b934f10d1208107c4d283259bf6c8325c854eb6e649f0e3b629e370c66e99"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-k8s/2.0.0/consul-k8s_2.0.0_darwin_arm64.zip"
    sha256 "3908886ba5bcd4c2bcd8224f3e3b0d8f412444942663f6b97110499bfe7c68de"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/2.0.0/consul-k8s_2.0.0_linux_amd64.zip"
    sha256 "98a4d1b565604512a752c049a555050512a80b03a41ebc138371178ea341c5fe"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/2.0.0/consul-k8s_2.0.0_linux_arm.zip"
    sha256 "d7c82f2023285303cff3cd80fd6832b621ae184cc84452740c560d9c1e12a901"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/2.0.0/consul-k8s_2.0.0_linux_arm64.zip"
    sha256 "e8a5a01f9128b7438b751e90e30c2919b096ae6c729bd907be327eee69485912"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
