# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.44.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.44.0/vault-radar_0.44.0_darwin_amd64.zip"
    sha256 "67a70d2b58f77402c7c3e6fe53a4f72aa1445bce1934a9397026ae17bb5d8f29"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.44.0/vault-radar_0.44.0_darwin_arm64.zip"
    sha256 "488fa5c7d4b84a6323d2138532b4e6b87e11fdde8dd9507427a04abbecb07b10"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.44.0/vault-radar_0.44.0_linux_amd64.zip"
    sha256 "8994569468d4d03cef90e9e334c4849096fe484e7625e2abb7a4c1756d8e4d8e"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.44.0/vault-radar_0.44.0_linux_arm64.zip"
    sha256 "af13de8998c214ca86d6ae181fc2ffe5239723611420935e694381ac0367d222"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
