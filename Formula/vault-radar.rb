# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.7.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.7.0/vault-radar_0.7.0_darwin_amd64.zip"
    sha256 "4c21b099f21945760ed2acc82bdb24f45b01c5da64d017e5ed1c6444c4fd055c"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.7.0/vault-radar_0.7.0_darwin_arm64.zip"
    sha256 "35be665458d0a30e9c333665da32271aad4e4d88eaaa6af6b4de9721516776ca"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.7.0/vault-radar_0.7.0_linux_amd64.zip"
    sha256 "869a8a4c3e6da907160e6fa07dfc81327d9de94f84d8d9deb958eb5805bebd3d"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.7.0/vault-radar_0.7.0_linux_arm64.zip"
    sha256 "08e845f0d846a90c35ffcc93a63df7acc3af81e8e4ae37b9f7df670452bbfb8b"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
