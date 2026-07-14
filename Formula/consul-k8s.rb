# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "2.0.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/2.0.2/consul-k8s_2.0.2_darwin_amd64.zip"
    sha256 "d03dcea9833e164be0b65b36af28c0f73899978ba7eb917424d6c4536b2d124a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-k8s/2.0.2/consul-k8s_2.0.2_darwin_arm64.zip"
    sha256 "75ffdc02d64efce279f79e89a36be703cba439a4285bb3aaa311ce4a79631e7d"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/2.0.2/consul-k8s_2.0.2_linux_amd64.zip"
    sha256 "54875a91099dbcad2324392b5b0d27fd39d2ddb96075522bd12467ec2a1604ee"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/2.0.2/consul-k8s_2.0.2_linux_arm.zip"
    sha256 "e07c46f9717c4b977257f8adf404721bd49d9cf5924874c5853792d9fd4e6ad6"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/2.0.2/consul-k8s_2.0.2_linux_arm64.zip"
    sha256 "86d5c4257cadbe500c00d5b0ddd79c2c07068421c4b14ccabc8100befc2253e0"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
