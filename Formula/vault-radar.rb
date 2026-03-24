# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.45.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.45.0/vault-radar_0.45.0_darwin_amd64.zip"
    sha256 "f364f521cd337c45d88f61def14546c7d38fb98194236be157b4d390fa10850d"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.45.0/vault-radar_0.45.0_darwin_arm64.zip"
    sha256 "d1db4968283228ff7c99acf3125f9239378bf0b89caf1bb86ab03cec32589b7a"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.45.0/vault-radar_0.45.0_linux_amd64.zip"
    sha256 "16a0527df8c2dc0b6202c179368d266e4b5a3b3df110781487752084bf31c55b"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.45.0/vault-radar_0.45.0_linux_arm64.zip"
    sha256 "59f7333d128b6ba987de8bfb0cb432adbaae483b773c5ab95fbbbbfcd3104809"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
