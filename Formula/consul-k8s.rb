# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "1.6.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.6.1/consul-k8s_1.6.1_darwin_amd64.zip"
    sha256 "e5f2f23e6eaf9e1c100de8f2b7d3a102081335349c9697d4d43451cf7be3278f"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-k8s/1.6.1/consul-k8s_1.6.1_darwin_arm64.zip"
    sha256 "70eec836312ac20081a6a1828e97310936f8b17fdfc9b34516e6fa4c79c0831a"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.6.1/consul-k8s_1.6.1_linux_amd64.zip"
    sha256 "c39f83a3ef80bd06ea047c0fe0ac022f852d12533b799b353453412479f43f52"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.6.1/consul-k8s_1.6.1_linux_arm.zip"
    sha256 "a1d3ab23ae3082ddd2a3050a9fd68ed5be0dadf848e54184a157732b4ebee26d"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.6.1/consul-k8s_1.6.1_linux_arm64.zip"
    sha256 "3e0810290b5cd0ff01a834d51447163693a759af404d29b382cf9f38b635023c"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
