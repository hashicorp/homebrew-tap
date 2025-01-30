# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.21.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.21.0/vault-radar_0.21.0_darwin_amd64.zip"
    sha256 "8b70b4bca99114603a691fd05d35f7c15646681b148d1965984df0e20d2ca511"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.21.0/vault-radar_0.21.0_darwin_arm64.zip"
    sha256 "40a2843203320482072615b6384524f2d95054bf62da6c9fb4506e419938cac5"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.21.0/vault-radar_0.21.0_linux_amd64.zip"
    sha256 "14d8cab4be468079e8e1f007de510c2e5127d896bf0fdde4b1a1f73994a54b96"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.21.0/vault-radar_0.21.0_linux_arm64.zip"
    sha256 "e1d38569c640f15a886cd0c5d44e61935ab9e9efd4c68b9224fe3b9269833892"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
