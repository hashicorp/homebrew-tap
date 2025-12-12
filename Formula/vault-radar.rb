# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.39.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.39.0/vault-radar_0.39.0_darwin_amd64.zip"
    sha256 "ed029f6e9e3e27d8dcca42adb22125816f4fee5494719704f47bf1c68f9fcef6"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.39.0/vault-radar_0.39.0_darwin_arm64.zip"
    sha256 "dbbe87480473ac3a1782b4d0b4b02cffdcedfe3f7d5ca412c3c989bb2fec5dad"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.39.0/vault-radar_0.39.0_linux_amd64.zip"
    sha256 "79d969d3cfed060f3e9b5d2affce67e18c5fdc3af8d880ba249ad9c696879d5a"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.39.0/vault-radar_0.39.0_linux_arm64.zip"
    sha256 "7473121da92b8b1796857e97cddf1f09ba537813b431bf62737cffd3e6989417"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
