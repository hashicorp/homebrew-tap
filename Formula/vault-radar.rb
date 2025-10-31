# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.36.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.36.0/vault-radar_0.36.0_darwin_amd64.zip"
    sha256 "6c2c719e1b1b4d59e7ecb21fb105c7173b906de21dcba7746130a63d64361cd1"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.36.0/vault-radar_0.36.0_darwin_arm64.zip"
    sha256 "5a912e791ca1174beb06d75d450cf29c4df5a7667c2527e0d65ecb40b06f8182"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.36.0/vault-radar_0.36.0_linux_amd64.zip"
    sha256 "0ccc908e1a977ffbb14e9b8a6175111a8f04c084769b0622060fc1eb5a16277e"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.36.0/vault-radar_0.36.0_linux_arm64.zip"
    sha256 "2682ffdac514e5dab2d3f1f7f72a16659acaa524e36413ea2a2b668d0b554d35"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
