# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.46.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.46.0/vault-radar_0.46.0_darwin_amd64.zip"
    sha256 "70314ca277880066fb56ddd871f801d3b0e2459c6c0fbe8dd1ee38e0a159db6e"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.46.0/vault-radar_0.46.0_darwin_arm64.zip"
    sha256 "32505021fc850ebef70a5559d6ad9215341f52a35d42aaa229ba6ab7fc814dfa"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.46.0/vault-radar_0.46.0_linux_amd64.zip"
    sha256 "932c337589610c316d906c661eaac55ab588728c330b9bbfc94150bad876a51a"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.46.0/vault-radar_0.46.0_linux_arm64.zip"
    sha256 "a18ba8ca5ad63920dadaebffa2e77ab75eca03543d7e866cb74c80ace012ac94"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
