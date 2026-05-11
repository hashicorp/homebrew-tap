# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.47.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.47.0/vault-radar_0.47.0_darwin_amd64.zip"
    sha256 "c563142789ab3b9df73495ae77167294b6c934114377a8adf979e37300989dd1"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.47.0/vault-radar_0.47.0_darwin_arm64.zip"
    sha256 "388111bc2f34ea737252d2734f2b68b4818cc46bee621fb60346b9c6d537627d"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.47.0/vault-radar_0.47.0_linux_amd64.zip"
    sha256 "c45b1221402ff39df269964a64e7291d5d10be467d2a9b86275ef8c1f1119bac"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.47.0/vault-radar_0.47.0_linux_arm64.zip"
    sha256 "2a4583775b1d68075f0fc747a1cd63d9c73d356881bdeed681569b97403e8a0d"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
