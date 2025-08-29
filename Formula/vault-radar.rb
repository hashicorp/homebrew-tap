# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.32.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.32.0/vault-radar_0.32.0_darwin_amd64.zip"
    sha256 "370d0103e6adef8042e4a32d25687b1f6a543a926d4c32e7db30ecad22e14cef"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.32.0/vault-radar_0.32.0_darwin_arm64.zip"
    sha256 "10ba3c5d8137bc9b7de52eafe42c2a35d3684bc744dd53ab0965c6906f1bbdba"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.32.0/vault-radar_0.32.0_linux_amd64.zip"
    sha256 "0ec695e285670892879ad3e242d0d90a2ba5e336f01e54bf3eae5ece22ba0a4b"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.32.0/vault-radar_0.32.0_linux_arm64.zip"
    sha256 "58098040d58a1987c6e80e5a32f1d6608a7c4bafdeb8b1964c0319320a73fe17"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
