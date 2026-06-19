# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.50.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.50.0/vault-radar_0.50.0_darwin_amd64.zip"
    sha256 "0de57a8371e84f87311de459de5418a58b83f610c36cfd14c549473223660e06"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.50.0/vault-radar_0.50.0_darwin_arm64.zip"
    sha256 "454d134dd7468367c0e4dbaf29f8e554e8644a97be3a7eaec886b61166356e1a"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.50.0/vault-radar_0.50.0_linux_amd64.zip"
    sha256 "953a98ec041acf9b61795bc0a2c5cbfc76d57f290931cd47b72985729a06d038"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.50.0/vault-radar_0.50.0_linux_arm64.zip"
    sha256 "b19482e2f2ca65c3317644d67b594e58e2e426719694bbeda2372bf369323385"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
