# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.48.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.48.0/vault-radar_0.48.0_darwin_amd64.zip"
    sha256 "0de59dda93024fd8b67fdeb8cc9ecf687712e348d89397baeb4da0181bdf0063"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.48.0/vault-radar_0.48.0_darwin_arm64.zip"
    sha256 "0eec0d75b46aa8f74dc40f8f0fb90849e93c7d5408ac205554671e5060bc8821"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.48.0/vault-radar_0.48.0_linux_amd64.zip"
    sha256 "32b59c37f3b0eab707c679f1bc37936a38c42be7b40618f19540f6ca420523f6"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.48.0/vault-radar_0.48.0_linux_arm64.zip"
    sha256 "af57d9776b2b56c4103b964d654d09ba4dd2832852377b627aa8ef98f3ab5bd9"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
