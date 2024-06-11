# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.9.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.9.0/vault-radar_0.9.0_darwin_amd64.zip"
    sha256 "52dfa964f12298a6a20a51e4cc6fefdd98d4b20fc99c8d90bbeec98a41aed044"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.9.0/vault-radar_0.9.0_darwin_arm64.zip"
    sha256 "8b49985e1ee9ef896ce8c3402248920481ca2dff3457f03565747a5c24170d93"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.9.0/vault-radar_0.9.0_linux_amd64.zip"
    sha256 "5c6e383d5ebfdafe0c1585847d45daa04ede5c85555db8707feed83284e19b16"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.9.0/vault-radar_0.9.0_linux_arm64.zip"
    sha256 "364454c36eb4722c2070ba11bdb9440b78728d06c0bd34c18659570c23de731f"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
