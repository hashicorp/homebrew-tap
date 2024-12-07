# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.19.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.19.0/vault-radar_0.19.0_darwin_amd64.zip"
    sha256 "3c389062fe91876608eec8791c8971a1a260645f9b714ff10f3ab932c4d023f6"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.19.0/vault-radar_0.19.0_darwin_arm64.zip"
    sha256 "d9f5bfc2bd4b5d64973c4d6982c0e27d08bed0d95ad92d86861588d6e671947c"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.19.0/vault-radar_0.19.0_linux_amd64.zip"
    sha256 "7ac8608e97a914044265141e00e3646d499e8643eb203200fb0610254dfd2c17"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.19.0/vault-radar_0.19.0_linux_arm64.zip"
    sha256 "c449601aa853206357fbd4d97ac6c28b6037c32b969614b11999de5dacd27fec"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
