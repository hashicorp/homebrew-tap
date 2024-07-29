# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.12.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.12.0/vault-radar_0.12.0_darwin_amd64.zip"
    sha256 "63ef2954e9e5ae6d82c51a256c437e56026d97b9623a17f482f96fdb1934f24f"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.12.0/vault-radar_0.12.0_darwin_arm64.zip"
    sha256 "38318980c397ca8d98db1417825545e645c175b69addd189fbe31a3b381d82e9"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.12.0/vault-radar_0.12.0_linux_amd64.zip"
    sha256 "2ae160ff6b6af63ea8e319c6a058a096c2c083bcd95b5110c585764f37cd1169"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.12.0/vault-radar_0.12.0_linux_arm64.zip"
    sha256 "5b63fd45a979d0a5295197932b9a317bea3f754cc9f4547b36046ef119970ae6"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
