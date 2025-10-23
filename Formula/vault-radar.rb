# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.35.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.35.0/vault-radar_0.35.0_darwin_amd64.zip"
    sha256 "c2559b5d2af55a4ac99332855d58faa2fda0905010e0ae43e4ea23d659bf350d"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.35.0/vault-radar_0.35.0_darwin_arm64.zip"
    sha256 "02346311707ee6990812dba040ee1e4e08fe145541fb8df7ca38fb5ac729fcc6"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.35.0/vault-radar_0.35.0_linux_amd64.zip"
    sha256 "ca7a8455b2d838ce30b819b50856a94d0080afcc99061318add6b196aac987c2"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.35.0/vault-radar_0.35.0_linux_arm64.zip"
    sha256 "a793e7a3e07953228a67593b5479072dd995aff8db84f8472f9835366b55e607"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
