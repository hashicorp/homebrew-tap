# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.30.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.30.0/vault-radar_0.30.0_darwin_amd64.zip"
    sha256 "7c30c971bc4ae17535e675271e72163f37b3585dad198fb45b52f90647703f66"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.30.0/vault-radar_0.30.0_darwin_arm64.zip"
    sha256 "492f69cd9d2dd9d9cde825dbcdeeebd33e9bea84c7d60d4a852ea0f56cf36763"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.30.0/vault-radar_0.30.0_linux_amd64.zip"
    sha256 "cb33832a8a9ad9008599c1746b4b72e14613f596d45263d47dfc36b3789abe72"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.30.0/vault-radar_0.30.0_linux_arm64.zip"
    sha256 "78df72ba937d4655989580d0e2e39a597bf61b2791184257e672933919bc6434"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
