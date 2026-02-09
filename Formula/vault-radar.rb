# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.42.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.42.0/vault-radar_0.42.0_darwin_amd64.zip"
    sha256 "2ae15d7e6ba9dffab6f43245e8f3a614ec0043cdd6edee3d1e50b9b51300fa42"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.42.0/vault-radar_0.42.0_darwin_arm64.zip"
    sha256 "5180b986481618e423e751a00d22b0cc6b58d4b7131c4c536290c3b066cf731f"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.42.0/vault-radar_0.42.0_linux_amd64.zip"
    sha256 "7882817ee0a1dcce17dee02531bd8f4c107ad3aef78d03991495a1f154bb4f2b"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.42.0/vault-radar_0.42.0_linux_arm64.zip"
    sha256 "bdf910d33580d690a61cb98ee3fd8365e6080a4b4ee33d55221d86aff65b0953"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
