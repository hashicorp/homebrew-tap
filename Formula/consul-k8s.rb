# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "1.2.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.2.1/consul-k8s_1.2.1_darwin_amd64.zip"
    sha256 "4030bc090e6b7da301c726004cc5907f4140beed18168645efba1f8be2311ff4"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-k8s/1.2.1/consul-k8s_1.2.1_darwin_arm64.zip"
    sha256 "dc233bfc7589fa96ac791b37c803e77f24e91bb180d576ffaa998af6afff9649"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.2.1/consul-k8s_1.2.1_linux_amd64.zip"
    sha256 "3e816993e4826afc37437424ef5e52c3c0365afda1930c99b4f531878ffd9e3f"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.2.1/consul-k8s_1.2.1_linux_arm.zip"
    sha256 "00bf8928e534c273df875245ea0dad038e6ddb8ed17281d946727137b84bf239"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.2.1/consul-k8s_1.2.1_linux_arm64.zip"
    sha256 "bcc2cab05a83d24726b6c134c145a6fd71cccd3d2a78cff1580ec54643f35265"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
