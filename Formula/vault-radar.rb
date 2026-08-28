# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.51.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.51.0/vault-radar_0.51.0_darwin_amd64.zip"
    sha256 "ff89af097a9e338af5297a13718fdaa885b394032890d1d49236c9244c72449e"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.51.0/vault-radar_0.51.0_darwin_arm64.zip"
    sha256 "57ff6e0e91d902f32c2fb8bf8876bed3d4df05268c652dd80f804c203e52bbed"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.51.0/vault-radar_0.51.0_linux_amd64.zip"
    sha256 "f9538a0806d621f35ac838955af77b607b2b140ea543252908f964caea0cfd20"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.51.0/vault-radar_0.51.0_linux_arm64.zip"
    sha256 "e68f72a79bcc34f81a5710f93b71d0c45d27991f4f3ee30c1900ca12d894c12f"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
