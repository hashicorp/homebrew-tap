# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.16.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.16.0/vault-radar_0.16.0_darwin_amd64.zip"
    sha256 "0326ac120347c58f78a4f2f80552e6b8f54f5ba4504774ef276be46d939e03fc"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.16.0/vault-radar_0.16.0_darwin_arm64.zip"
    sha256 "5a56e18953b490feac43e72b886a183867d372670e717d6c54096bb363aff278"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.16.0/vault-radar_0.16.0_linux_amd64.zip"
    sha256 "0507025af98b3b9ca64f936cde50d28f8b1fd799ba48a19a517ebf8b7c0021bd"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.16.0/vault-radar_0.16.0_linux_arm64.zip"
    sha256 "d231d50ea70cd8e5bc754fa36b6283ac128627beabded338728152d4e4bc1018"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
