# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.17.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.17.0/vault-radar_0.17.0_darwin_amd64.zip"
    sha256 "3d88a6e6e8e5fdabbb6bc674d18f5517f0d49597c933d0a3d6f2223d4fe30e73"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.17.0/vault-radar_0.17.0_darwin_arm64.zip"
    sha256 "eddcf9f42d79fd72d76d422cb18dcb3453d8b92e92e1d41e6c6f33f6029c0d73"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.17.0/vault-radar_0.17.0_linux_amd64.zip"
    sha256 "636e494365155c63ceb70378b0dd5e5fc701bb36d4cfa340b3db5680bded20f9"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.17.0/vault-radar_0.17.0_linux_arm64.zip"
    sha256 "7df08ea3a02b7d1d6222fc937d337daa3afc171a3b34fa604253a0f2b9706294"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
