# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.27.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.27.0/vault-radar_0.27.0_darwin_amd64.zip"
    sha256 "8a44fbc3d83965a7dc2795b84f73cabe6a9ca13fd677e13faa64450cd133b238"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.27.0/vault-radar_0.27.0_darwin_arm64.zip"
    sha256 "9c11053d04630ca79cd242803ec24d261eeaa707eea7685964f0c731466313a7"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.27.0/vault-radar_0.27.0_linux_amd64.zip"
    sha256 "b59f8cd897d4d756c76f38d2ac7f2ecec100147e6a42ffc4d0ae05768c8f18f7"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.27.0/vault-radar_0.27.0_linux_arm64.zip"
    sha256 "34f89a70b2293bb850d805262e122e4275f6fdbe7589fd58b7ebf6a01d706656"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
