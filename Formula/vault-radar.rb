# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.55.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.55.1/vault-radar_0.55.1_darwin_amd64.zip"
    sha256 "92ead0d8a3a28ed0ae5168775882f1e7d1ff3f18d32f5b9896a48a79e0e800ee"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.55.1/vault-radar_0.55.1_darwin_arm64.zip"
    sha256 "7afcf6098f722693562023938414ad2b692672ab515dd44b10b09f286c3875e0"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.55.1/vault-radar_0.55.1_linux_amd64.zip"
    sha256 "80b130fa3e2ce46d2aa0f54f2baa415c620427f72f48252e259588d98e6083b8"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.55.1/vault-radar_0.55.1_linux_arm64.zip"
    sha256 "d638a686936e1a2ae6c537ab0e09c0fc9606f3d536fc98a6fd0436b98ce2eb12"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
