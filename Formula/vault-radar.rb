# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.23.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.23.0/vault-radar_0.23.0_darwin_amd64.zip"
    sha256 "3ee0107b43a46483fc0caf9a1e5d6b4e9d56a51947eb95221e22c12580b6e6c8"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.23.0/vault-radar_0.23.0_darwin_arm64.zip"
    sha256 "41bdd73e9857312f62f30e3802fb31120b9de41262b35d2de1eceed1067bfb17"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.23.0/vault-radar_0.23.0_linux_amd64.zip"
    sha256 "4c552e92821a38c3b2980f0fed056471c207248012a89485da4e689b04a34d64"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.23.0/vault-radar_0.23.0_linux_arm64.zip"
    sha256 "727eab47ec688b41750bc51e81e7f3dbdf779cf144989e59ef641bf2f163ad41"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
