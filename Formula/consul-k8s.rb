# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "1.3.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.3.3/consul-k8s_1.3.3_darwin_amd64.zip"
    sha256 "0ea2cea3642411ef1dba0b37c9259203a0393919641d39af60bfab5881652a1a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-k8s/1.3.3/consul-k8s_1.3.3_darwin_arm64.zip"
    sha256 "2cd5b76beefe793c78ff683839f9572734b3e494c93feae9bb50a09b26975d74"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.3.3/consul-k8s_1.3.3_linux_amd64.zip"
    sha256 "7b0d72820788e638a514984cb2b9d63459b835fcb3cf43fa28f5c533fe9f166c"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.3.3/consul-k8s_1.3.3_linux_arm.zip"
    sha256 "744bb39aea9fc0905b915ffa9a6bd5f98f7d46f42bdce85420d1549b30c99867"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.3.3/consul-k8s_1.3.3_linux_arm64.zip"
    sha256 "58960bc6c1c760e78ceddf27fb8d5f38679620d317045d0e4ba4c15dd9884fd6"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
