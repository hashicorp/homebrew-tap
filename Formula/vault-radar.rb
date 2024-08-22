# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.13.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.13.0/vault-radar_0.13.0_darwin_amd64.zip"
    sha256 "3f2d5841de4900c4a814cf4eff95cad86b87f0419736987a6803e255a02df690"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.13.0/vault-radar_0.13.0_darwin_arm64.zip"
    sha256 "d60e167ab27233e92ccb121dc6397093a4989df3b3a7dd000dfaffff75f68620"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.13.0/vault-radar_0.13.0_linux_amd64.zip"
    sha256 "4156d586fca754b49d5a2e9de68551750b76bb1c4a47fb085b12154f97d1ba03"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.13.0/vault-radar_0.13.0_linux_arm64.zip"
    sha256 "7c7c5826276194c0e4c5747617196c6cbb887307e84c92a62899fe8c99768e30"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
