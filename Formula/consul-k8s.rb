# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "1.4.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.4.3/consul-k8s_1.4.3_darwin_amd64.zip"
    sha256 "e15e082305c046ce91b5964f6e7b8012920fee9fe173e4863666a60710d639d1"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-k8s/1.4.3/consul-k8s_1.4.3_darwin_arm64.zip"
    sha256 "31b3f557bd279992d7da6c8c4b139d6988f5254cf0232e67538940d865967535"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.4.3/consul-k8s_1.4.3_linux_amd64.zip"
    sha256 "f275e013fafc061d887925521876bfa005827d6df01080752e80f341135990ca"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.4.3/consul-k8s_1.4.3_linux_arm.zip"
    sha256 "8a959754ddafabb7b5b61e8f2d28f0ad2da893e947ed924d154452f4169bab14"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.4.3/consul-k8s_1.4.3_linux_arm64.zip"
    sha256 "907d3697f205e4ccc121fd28b9211dd6fef0b61c2de1433ac9840a6f86f72b44"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
