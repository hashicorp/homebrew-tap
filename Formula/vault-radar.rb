# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.29.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.29.0/vault-radar_0.29.0_darwin_amd64.zip"
    sha256 "ea4779876f8cda108a184ec73e8940b36561ea0c2cc28b77da91acd845637aa6"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.29.0/vault-radar_0.29.0_darwin_arm64.zip"
    sha256 "6379fdfb93115e7c5598adf51ffe69c9a67da5c1eb7b0dd4721d25c33f4232d7"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.29.0/vault-radar_0.29.0_linux_amd64.zip"
    sha256 "97bde105a3329c2e4c7ad91b7736954698ae69b00ce42e66714ca1e84fdbafbc"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.29.0/vault-radar_0.29.0_linux_arm64.zip"
    sha256 "5124749ea918e6a35f07a185c573602243465c1b48695552e6024a063464bf9a"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
