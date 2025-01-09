# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "1.6.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.6.2/consul-k8s_1.6.2_darwin_amd64.zip"
    sha256 "c2d6b0832568d77ef5b6a00113160f5e417ddf1a8a86680c4474f7efe5e16c85"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-k8s/1.6.2/consul-k8s_1.6.2_darwin_arm64.zip"
    sha256 "13f16dd8fc1579e6e1e212310426eadabdf6456eef3978591cf7b5a02bd4ddc3"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.6.2/consul-k8s_1.6.2_linux_amd64.zip"
    sha256 "a442ad24b5f95c48bbb259e625bb517d1c647155d48eedea5e0129a2bbf28f59"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.6.2/consul-k8s_1.6.2_linux_arm.zip"
    sha256 "203d2b5f90b55a151dddd525bb83f2cc68e32d7e3541ca9e0c927d6baa1d88c0"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.6.2/consul-k8s_1.6.2_linux_arm64.zip"
    sha256 "90d67d7d25e0274b463f6a0778d85d8b161b0afdbb7d3087629f3fc3f356fdce"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
