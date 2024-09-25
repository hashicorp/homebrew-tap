# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.15.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.15.0/vault-radar_0.15.0_darwin_amd64.zip"
    sha256 "87950f457d3be00f19515aa729c4a602f3acde3ab2c191f4493b01c73a737427"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.15.0/vault-radar_0.15.0_darwin_arm64.zip"
    sha256 "665372077b56d55d23b64d5e7cf9a1e5f2fbc0d6d041f975a0c00edf98dcd184"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.15.0/vault-radar_0.15.0_linux_amd64.zip"
    sha256 "46e9f9065afdd2974d7e55b9c1fb09045565c9b8a21dc93a31bb67fb54ce2961"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.15.0/vault-radar_0.15.0_linux_arm64.zip"
    sha256 "52505ba672fa945e23226265c9d51c036cf14b308a3b09974563c18a3880a6dd"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
