# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.26.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.26.0/vault-radar_0.26.0_darwin_amd64.zip"
    sha256 "7fd27794c07106074e0fd998e46640bac932ea2d60e54bbba6267fa63e6dccb0"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.26.0/vault-radar_0.26.0_darwin_arm64.zip"
    sha256 "b6de8e38cf1d1908bf6b1831c5800fb4987517678fbbfda956b679546b9e0985"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.26.0/vault-radar_0.26.0_linux_amd64.zip"
    sha256 "327ee3655bc2d8a7cb81594558824026b5bf9bc8bebfd82e9bacd4c034f9d204"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.26.0/vault-radar_0.26.0_linux_arm64.zip"
    sha256 "354504d489d50a1c0766b11f015a66a5e598b823a938327c66a2c9efbd4234a2"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
