# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "1.9.7"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.9.7/consul-k8s_1.9.7_darwin_amd64.zip"
    sha256 "3279f121fed6c10c038d08b55e0ff3d8671c7248262f40b65a57aea7c24ab340"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-k8s/1.9.7/consul-k8s_1.9.7_darwin_arm64.zip"
    sha256 "6109a26425e5af74ccc7e4da26bbd584db19458f25841f4c515f1146f30b57b3"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.9.7/consul-k8s_1.9.7_linux_amd64.zip"
    sha256 "adff6b04804ef931eaed4a02018a4a1e7e3f6ca8b2f5f3a244c33ef4a3523573"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.9.7/consul-k8s_1.9.7_linux_arm.zip"
    sha256 "2345717b82325fa3594903f130811498e7e0b253bfd93f5f6d459a9b40c46063"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.9.7/consul-k8s_1.9.7_linux_arm64.zip"
    sha256 "ff1ca130b61efab02a220a243f5a5915f94605f44bb1c973234856933de360e1"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
