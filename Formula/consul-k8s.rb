# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "1.9.5"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.9.5/consul-k8s_1.9.5_darwin_amd64.zip"
    sha256 "a604ba09f4925c989da2c6943bc4cc042513fbdddd2cebfeb29f29aca87f3a15"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-k8s/1.9.5/consul-k8s_1.9.5_darwin_arm64.zip"
    sha256 "3a758d7d2d841aa7d4f571bd9bc0417e8917542942250d7f2b3f729911786581"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.9.5/consul-k8s_1.9.5_linux_amd64.zip"
    sha256 "8f609d744d56ae0db40730b7cde79c392dbc8afa7ff3a8cbb86271c5ee5585e5"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.9.5/consul-k8s_1.9.5_linux_arm.zip"
    sha256 "4f25f57482d33abe91afe87d12b97e7aa36870e80b0c0f7830a9eb9a0986fa41"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.9.5/consul-k8s_1.9.5_linux_arm64.zip"
    sha256 "4f0d01f08c549c9dbfeb9d7c25eea531d5eb6656707f23a1ec2a2a2fb30b38b1"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
