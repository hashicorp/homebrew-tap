# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.18.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.18.0/vault-radar_0.18.0_darwin_amd64.zip"
    sha256 "aa38f1bf42af2bfc23986a5c5b46ec1d7a052a09b26f0fae94cec80602e742a6"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.18.0/vault-radar_0.18.0_darwin_arm64.zip"
    sha256 "90562f858f4d3a34c2af32deb90a12f04154145bae21da5ac3bf61a0d55dbd32"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.18.0/vault-radar_0.18.0_linux_amd64.zip"
    sha256 "83cc35c334165c28328fdae827d5b65e40372be77296a94cdd5f818e89fe5812"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.18.0/vault-radar_0.18.0_linux_arm64.zip"
    sha256 "eff4f5d00884b33113936b574f7049746ecd8a46f48326070259f6b391c0a1d9"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
