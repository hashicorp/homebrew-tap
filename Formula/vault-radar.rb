# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.33.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.33.0/vault-radar_0.33.0_darwin_amd64.zip"
    sha256 "57e26e57e2ca5578cc025bb29943849f2aa4e79cb4cd50a67b370c36b55848b1"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.33.0/vault-radar_0.33.0_darwin_arm64.zip"
    sha256 "db50c3f7506a21098dbe0d2993abcc70b2c70b367b3defa808d4ef4199da548f"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.33.0/vault-radar_0.33.0_linux_amd64.zip"
    sha256 "c99423073b823a84396e520c177406c362afca6e02ba40c6e940f9fff869ec5d"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.33.0/vault-radar_0.33.0_linux_arm64.zip"
    sha256 "9ad1d87f75a4fded1cbed41d701e98040e4fc1728de482b3877c851286cda13a"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
