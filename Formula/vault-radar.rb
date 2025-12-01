# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.38.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.38.0/vault-radar_0.38.0_darwin_amd64.zip"
    sha256 "d1c776b7f3677039ee44f666091b2087c3b836720a1ed88d1c74fa1164187ab0"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.38.0/vault-radar_0.38.0_darwin_arm64.zip"
    sha256 "8f59af3d9f4699adffdcd95918b13f38f6ca21e0cd792edc3bcf6a6ac5836f4c"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.38.0/vault-radar_0.38.0_linux_amd64.zip"
    sha256 "b021d0acbf28716fdfe73b89b1ab08c96579bffc1139160eded4c256b92403ee"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.38.0/vault-radar_0.38.0_linux_arm64.zip"
    sha256 "cfff2782819a0dfad66b795dc02e1ed57be047a85d707ccf635af4b34e757a41"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
