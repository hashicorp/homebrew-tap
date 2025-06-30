# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.28.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.28.0/vault-radar_0.28.0_darwin_amd64.zip"
    sha256 "8a764359ec055a56b6d4b52a5cd14b94a39db092ab27487542bf717879ef88e3"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.28.0/vault-radar_0.28.0_darwin_arm64.zip"
    sha256 "4e74a00fdda1a35ee70b4e5c81b07af069c6811e22ae22db97b7f8f5a5e4e886"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.28.0/vault-radar_0.28.0_linux_amd64.zip"
    sha256 "7acca143cb990bcad0bd12bcbcba116758d54e5c9350764bc4c42aef7ee9925a"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.28.0/vault-radar_0.28.0_linux_arm64.zip"
    sha256 "f02a97439718a84f697138a88028bb9f7354887907d829d30bd3e49ccb772f81"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
