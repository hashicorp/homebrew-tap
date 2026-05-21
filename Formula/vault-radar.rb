# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.48.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.48.1/vault-radar_0.48.1_darwin_amd64.zip"
    sha256 "fadac3be38e42aa33f26c204d71923143c82d15ed0068e97a8f13974e5cad4a9"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.48.1/vault-radar_0.48.1_darwin_arm64.zip"
    sha256 "4b98292a2f1bec26b263aab0b74d497bcd2849ceecd083287d17d38889db8b0c"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.48.1/vault-radar_0.48.1_linux_amd64.zip"
    sha256 "e1e22179abd7f84ce70fccc758193d37997e1d3c449410683c68c7598d3c95a2"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.48.1/vault-radar_0.48.1_linux_arm64.zip"
    sha256 "011e7a020ff494d34a33278fb4ea1791c8f5028db5d2cde639faffecb9c1ad65"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
