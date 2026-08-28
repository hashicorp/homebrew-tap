# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.52.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.52.0/vault-radar_0.52.0_darwin_amd64.zip"
    sha256 "81b3fbd8c944850f417fa9e3c06a197891c0b96fe54eb156e2a4b03fb439093e"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.52.0/vault-radar_0.52.0_darwin_arm64.zip"
    sha256 "9e97c806de4c27010beff516b24b0202c194b3c6c7076fa064fb214250b0ee96"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.52.0/vault-radar_0.52.0_linux_amd64.zip"
    sha256 "a316953b9195ba135411b4c21defcacff79e39185704f0f057c1bb1d7d9258f9"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.52.0/vault-radar_0.52.0_linux_arm64.zip"
    sha256 "6c9a774f6d1789d04adba91c2e5e8d7f8fb984d6a20b07d33ff7c5aac08c9faa"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
