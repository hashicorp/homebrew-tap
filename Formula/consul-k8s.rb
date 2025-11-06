# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "1.8.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.8.4/consul-k8s_1.8.4_darwin_amd64.zip"
    sha256 "c2c55e758b77c01c049af2546ca1eea21c7ea89c16e08bfd0f25093d282bc95a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-k8s/1.8.4/consul-k8s_1.8.4_darwin_arm64.zip"
    sha256 "4bcbed76cb15d7b5880dfe609e51a9fad3fc2da9ea592f40e67a43092f47c3e8"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.8.4/consul-k8s_1.8.4_linux_amd64.zip"
    sha256 "26ff6d8b6a084db81cb993d91cb311c3591011ca09c36510c1d46553bcb02191"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.8.4/consul-k8s_1.8.4_linux_arm.zip"
    sha256 "04bce8a28592d27e7a5061fe0620b9310ef39f618f74bed4ca2b7248ccaf3e5c"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.8.4/consul-k8s_1.8.4_linux_arm64.zip"
    sha256 "84d1a9f6669c3901d9410bda783ee1294d241e4082effd94bb1f03d742c116ca"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
