# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.21.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.21.1/vault-radar_0.21.1_darwin_amd64.zip"
    sha256 "48d4849349c0c9a35ab72247bd1b939e5fe7312a708f33e1358434bee6213ef8"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.21.1/vault-radar_0.21.1_darwin_arm64.zip"
    sha256 "1657f4f4fd14f81f57b63fe9256fee5bb1c9d6cf52e2e0b8a580025e90c27f2d"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.21.1/vault-radar_0.21.1_linux_amd64.zip"
    sha256 "4a264d6495d2091520d047fb632f6095476e22dfec1b35900f7b660f414dc9bd"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.21.1/vault-radar_0.21.1_linux_arm64.zip"
    sha256 "f2f05791de66174b4ac43fa0ab8cbf3b73a5c51b23cc1d6c18fde7d1f8f99cd1"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
