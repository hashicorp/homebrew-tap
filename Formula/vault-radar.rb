# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.11.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.11.0/vault-radar_0.11.0_darwin_amd64.zip"
    sha256 "63d6ae4f3fa6d917e667e308670b550d2411176a358c545247a964740209c4b9"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.11.0/vault-radar_0.11.0_darwin_arm64.zip"
    sha256 "7e367840106706e6cb93c68106b193ea50607345afa3b82f2c5f8d64ba23bc86"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.11.0/vault-radar_0.11.0_linux_amd64.zip"
    sha256 "59b17e18cf7993bc1ad96c277d15ed3a758bb626363e0a01bed4a4733f2b732a"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.11.0/vault-radar_0.11.0_linux_arm64.zip"
    sha256 "e613946324960653cf72ac192707341a7ff5aa193ca117557365b543f8584d68"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
