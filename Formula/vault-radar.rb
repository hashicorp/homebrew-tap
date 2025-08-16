# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.31.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.31.0/vault-radar_0.31.0_darwin_amd64.zip"
    sha256 "fc4da69f2690f5647d9c6f314a522a048ab1fba0730a4e57be5cf64cad453f96"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.31.0/vault-radar_0.31.0_darwin_arm64.zip"
    sha256 "f048b108447b1b4f8498e2afbb2f9437f43a2dc1d70a7248a43b5f06ac764e14"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.31.0/vault-radar_0.31.0_linux_amd64.zip"
    sha256 "00588a23e34afb69f454608029fe6ff16d9abea45a2342a3586da8bc6014239e"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.31.0/vault-radar_0.31.0_linux_arm64.zip"
    sha256 "cc2c0b825ee4acd573072b47ecb587cf1a34d76d97edf7b0bb0dfe794659fe15"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
