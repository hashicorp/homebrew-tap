# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.25.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.25.0/vault-radar_0.25.0_darwin_amd64.zip"
    sha256 "378037d081ae5e39c884ea19b1626353e1cef8d7a11b0cfea0e02d7567503ec3"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.25.0/vault-radar_0.25.0_darwin_arm64.zip"
    sha256 "a76dc3991f10e25915413e99be9194fcb2090689afd6e0f4f40a21de6baf2177"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.25.0/vault-radar_0.25.0_linux_amd64.zip"
    sha256 "cc82ebf1f236e4344b1e71b16b623569435969c083717c923d5fe6cf2b99b78b"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.25.0/vault-radar_0.25.0_linux_arm64.zip"
    sha256 "97e25a8c09bc544cf7e522407b2006cbff50512866ef7ffb1f1850fff7e1296e"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
