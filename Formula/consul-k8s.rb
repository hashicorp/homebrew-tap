# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "1.9.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.9.0/consul-k8s_1.9.0_darwin_amd64.zip"
    sha256 "37774b29da8bedad45017de8d918e7e8d3ed138b5275924b289373123383fe82"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-k8s/1.9.0/consul-k8s_1.9.0_darwin_arm64.zip"
    sha256 "f2b789f288b8451393c536c2cac070c62ebda2bc2224c851524edff886992bb2"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.9.0/consul-k8s_1.9.0_linux_amd64.zip"
    sha256 "5c84933be28f8276faddd56a81b9bafe81cfac13b96949145ff49ab459937a1f"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.9.0/consul-k8s_1.9.0_linux_arm.zip"
    sha256 "bd51830ccc090a4a3004e36f0644ae35f45aa4c0f215b14b09507077b2494755"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.9.0/consul-k8s_1.9.0_linux_arm64.zip"
    sha256 "6c2e16cc68183e4f3567723da2311fccfa22274a02cb250ef13bfda7a0541696"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
