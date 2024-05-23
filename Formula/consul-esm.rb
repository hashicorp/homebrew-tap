# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulEsm < Formula
  desc "Consul ESM"
  homepage "https://github.com/hashicorp/consul-esm"
  version "0.7.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-esm/0.7.2/consul-esm_0.7.2_darwin_amd64.zip"
    sha256 "79145ce7dc6a48965a5f6ff94428bd2ccc9b465bc0d81113cd22cd3114fde942"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-esm/0.7.2/consul-esm_0.7.2_darwin_arm64.zip"
    sha256 "7ecdab10e4a7f2533aaf0c9909b0a6a2c52f99c899447dd9c8dfece8742ca86d"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-esm/0.7.2/consul-esm_0.7.2_linux_amd64.zip"
    sha256 "c6ad998ac5599eacddc54800355c39d289e486f5a61e3d92a5580895e4e8bdd5"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-esm/0.7.2/consul-esm_0.7.2_linux_arm.zip"
    sha256 "f98d817f643621cb377c9abc5486b2edfae8c885a1831450595b74ae7bc0e2cb"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-esm/0.7.2/consul-esm_0.7.2_linux_arm64.zip"
    sha256 "e4ced673bbf2c70931301a3f5a5daaa1450a82876096c4f1177a20f02edf7683"
  end

  conflicts_with "consul-esm"

  def install
    bin.install "consul-esm"
  end

  test do
    system "#{bin}/consul-esm --version"
  end
end
