# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "1.6.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.6.3/consul-k8s_1.6.3_darwin_amd64.zip"
    sha256 "b646902325f73a37475f386ea29a074d975a7de8c9fbf9f40ced31be51227093"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-k8s/1.6.3/consul-k8s_1.6.3_darwin_arm64.zip"
    sha256 "6abba63fdf81a22fd81973a7ff0d8a838a6b87bafc0cc251ee6810627a1b7343"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.6.3/consul-k8s_1.6.3_linux_amd64.zip"
    sha256 "54b632f3bc5a6cc3825c4afac5b9b08b3cb9980d41df12adf79c9c455e239234"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.6.3/consul-k8s_1.6.3_linux_arm.zip"
    sha256 "6d145f000cf8e1c1b8a917ed34eea2520be5a1588a8d9ac5526e3fa9603e4103"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.6.3/consul-k8s_1.6.3_linux_arm64.zip"
    sha256 "8a2f54b2d69d3d75a9e9888e115da7bc6833a718c953475b842a79e8aafda351"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
