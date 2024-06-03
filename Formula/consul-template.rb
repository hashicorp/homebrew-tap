# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulTemplate < Formula
  desc "Consul Template"
  homepage "https://github.com/hashicorp/consul-template"
  version "0.38.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.38.0/consul-template_0.38.0_darwin_amd64.zip"
    sha256 "52fe88455cfd9fe4b27a533f7aa92dd1b0360e055b9bb90d6706f858e1bb5b86"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-template/0.38.0/consul-template_0.38.0_darwin_arm64.zip"
    sha256 "d7697fba364aab3f5be921f1138e8f91e806f93d5def6ee1212b31b2bd2d5cf6"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.38.0/consul-template_0.38.0_linux_amd64.zip"
    sha256 "9a30bb3599084880fb2acb97e96a25f01803c2025184ab2488ced7f528e88032"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.38.0/consul-template_0.38.0_linux_arm.zip"
    sha256 "e126432b93cebf6d6338d2f464a6e169b839f74ef7ac037ffa5b1dc57ff0c446"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.38.0/consul-template_0.38.0_linux_arm64.zip"
    sha256 "db73564ba5f854855eb089771f9cdbce44ee398fd8374938e24221ac8af2ad94"
  end

  conflicts_with "consul-template"

  def install
    bin.install "consul-template"
  end

  test do
    system "#{bin}/consul-template --version"
  end
end
