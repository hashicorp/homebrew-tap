# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "1.7.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.7.2/consul-k8s_1.7.2_darwin_amd64.zip"
    sha256 "647937d610e09db9fb09da44a5ecd74b9a89156aa89c6f85df152f2fe3f4c11d"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-k8s/1.7.2/consul-k8s_1.7.2_darwin_arm64.zip"
    sha256 "9ad3ae039f20af8c04680dda2aac509025d1c13a03093c2cdaebc04ef0bfcdb6"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-k8s/1.7.2/consul-k8s_1.7.2_linux_amd64.zip"
    sha256 "f04273775aec9a5258b0e0680272fc667bdd84833da90de9f16e82f483ba3dd4"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.7.2/consul-k8s_1.7.2_linux_arm.zip"
    sha256 "419a577c0a26d80567847aa6684748cb1514a827c6de8e055361d2ae8118b63f"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-k8s/1.7.2/consul-k8s_1.7.2_linux_arm64.zip"
    sha256 "080a49960be186a9f3d1712ba3a56f78d96938b7072a1a2f01e269fba955dd8d"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end
