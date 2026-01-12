# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.40.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.40.0/vault-radar_0.40.0_darwin_amd64.zip"
    sha256 "90ab3849914f15fcc33071ce05511a597b4c702d56e730d4ba9b0b64672a2545"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.40.0/vault-radar_0.40.0_darwin_arm64.zip"
    sha256 "c40effb8cb893f1ab8443ba83e9103c9e0003187ffecd0a6cf4bce50dbab551a"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.40.0/vault-radar_0.40.0_linux_amd64.zip"
    sha256 "e08e66c9d37a352fcfd2991db5e1cea266dc9c0d1a1b1dcc5accbce9192cbe6e"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.40.0/vault-radar_0.40.0_linux_arm64.zip"
    sha256 "370cb0addb3313d5165923e983e457c380dbfb773f351db29d14be1c8c45dfc8"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
