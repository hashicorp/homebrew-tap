# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.7.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.7.1/vault-radar_0.7.1_darwin_amd64.zip"
    sha256 "b14b8da55ba8451ffe540f0be05be3179087a42dd7b7f879cf511cdd110e2db5"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.7.1/vault-radar_0.7.1_darwin_arm64.zip"
    sha256 "8027616c1e59530964f224eac1414dc22e9b5f520ccf63d3a440bcae9033d224"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.7.1/vault-radar_0.7.1_linux_amd64.zip"
    sha256 "62cf7a0e7b16813908864d7f620ce5c98dc38a0ae64032033d289c597e1cfb83"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.7.1/vault-radar_0.7.1_linux_arm64.zip"
    sha256 "603c97a33ee253613c42dd692224b6bf3aa68f8b7c5e9ec8f0e1b0125327b603"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
