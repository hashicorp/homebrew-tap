# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.20.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.20.0/vault-radar_0.20.0_darwin_amd64.zip"
    sha256 "e5e5357e1d33675b82adb4fa9de837a38643db2fdbf8445e0f45f7303e75bc4c"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.20.0/vault-radar_0.20.0_darwin_arm64.zip"
    sha256 "7ecb96e287882a6b0f96099453588273bb87d09d035c1d8852ebba0d2bdeedb1"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.20.0/vault-radar_0.20.0_linux_amd64.zip"
    sha256 "8108aca89f37cc766cd2224f6168ca44ed9b72f9cdef71038f54889e6fab5bd0"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.20.0/vault-radar_0.20.0_linux_arm64.zip"
    sha256 "2a461a315e2822cfafc8f0c4a60b6634a47eabfc9bc8103bdb05839d21c8a15e"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
