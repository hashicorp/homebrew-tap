# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "1.6.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.6.4/consul-k8s_1.6.4_darwin_amd64.zip"
    sha256 "0912f593695f47994a70fd013ae79546be6dd2691c6eb5280526f4a08dfd2d83"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-k8s/1.6.4/consul-k8s_1.6.4_darwin_arm64.zip"
    sha256 "639fb6b595dcdd2dd02b5cd264b3fcf6824634977d03c92a92b61f8922f5add0"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.6.4/consul-k8s_1.6.4_linux_amd64.zip"
    sha256 "329fc71ea39ed44c9917442ec3334c8ba077916e42e7639d2089c7fa06c5d5d7"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.6.4/consul-k8s_1.6.4_linux_arm.zip"
    sha256 "b70394de3660bd120a58470e528d7b63369de0206cb96acd00931088baa40828"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.6.4/consul-k8s_1.6.4_linux_arm64.zip"
    sha256 "56f1595e9bf67fc4abfe2c07a423da42290371ccd0d188a9f1ebdf3e36604549"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
