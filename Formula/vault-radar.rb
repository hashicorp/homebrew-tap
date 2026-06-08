# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.49.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.49.0/vault-radar_0.49.0_darwin_amd64.zip"
    sha256 "788df6d87db8a9848203ff6e448ec057f402cd9d2a80f20e9db8c45b842c09d1"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.49.0/vault-radar_0.49.0_darwin_arm64.zip"
    sha256 "bcf717b658e263d7d84fa6b2c0ead7a4b09ad4fb28d38b9a3af3991b0c54aa8b"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.49.0/vault-radar_0.49.0_linux_amd64.zip"
    sha256 "702a911e04b273603aa438d59f10c4048a026290b2301930fef5cd68b4662158"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.49.0/vault-radar_0.49.0_linux_arm64.zip"
    sha256 "04e881fab2fc3528ffdae6b2298e2c7cd4141f495434b4cc20b8e36c5fb5a6ff"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
