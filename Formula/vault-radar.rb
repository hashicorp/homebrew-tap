# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.54.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.54.0/vault-radar_0.54.0_darwin_amd64.zip"
    sha256 "ce073f3eaa7951de9b99d842f7398d55c64f2b79618172c846115733882f4365"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.54.0/vault-radar_0.54.0_darwin_arm64.zip"
    sha256 "90d04f9bdf006461c2d293af1e2740cf91a5e7e538bf0f86e9c37855c022788a"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.54.0/vault-radar_0.54.0_linux_amd64.zip"
    sha256 "016518b693ac67613dfcebd946f3962b8bd1cbd256da0a2b50083e85cf6d8c87"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.54.0/vault-radar_0.54.0_linux_arm64.zip"
    sha256 "74acb658d922ffd7d885a0732f1a4823fee070dab7cc372d9dd5ac5028788b4d"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
