# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.8.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.8.0/vault-radar_0.8.0_darwin_amd64.zip"
    sha256 "570822304ac68caf7bc21848a1910c2876b724528a26e42dc6cdfc2a256bbff1"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.8.0/vault-radar_0.8.0_darwin_arm64.zip"
    sha256 "58e20750c10d9f1d30e9758b8307f5ab3a7a45e636f07cbbdba341ad854b8995"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.8.0/vault-radar_0.8.0_linux_amd64.zip"
    sha256 "347bce6bf175ae0b7ab4ffb25be85f7b9e9dd12725a2a12274f78130de2ddf33"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.8.0/vault-radar_0.8.0_linux_arm64.zip"
    sha256 "b59410ab32eebd6f0c428bf78f506ad69a67e34d2ea1f945bca453adb01d3e60"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
