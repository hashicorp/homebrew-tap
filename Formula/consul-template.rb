# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulTemplate < Formula
  desc "Consul Template"
  homepage "https://github.com/hashicorp/consul-template"
  version "0.39.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.39.0/consul-template_0.39.0_darwin_amd64.zip"
    sha256 "5e773e01009892e5645b6e08e3380e132987fdecdb24221ed283bf60ddbc7e02"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-template/0.39.0/consul-template_0.39.0_darwin_arm64.zip"
    sha256 "b6d8c6d59e2b9a1d3f02b4f653322f940192ab47553f2810a0fab152e81a7232"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-template/0.39.0/consul-template_0.39.0_linux_amd64.zip"
    sha256 "10e7eba0acc307ab6500e49f75bdb95d8c7273266822e936f78a1c72425e7f4f"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.39.0/consul-template_0.39.0_linux_arm.zip"
    sha256 "0a200e8a149489714811b83f3aa2623f2d8f00478311d292565c381718c94160"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-template/0.39.0/consul-template_0.39.0_linux_arm64.zip"
    sha256 "6e5f6880fef6b08348d8d68e6027d25742c8576367f8a6714da1b8ff79fb9c85"
  end

  conflicts_with "consul-template"

  def install
    bin.install "consul-template"
  end

  test do
    system "#{bin}/consul-template --version"
  end
end
