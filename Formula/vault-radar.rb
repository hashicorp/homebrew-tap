# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.53.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.53.0/vault-radar_0.53.0_darwin_amd64.zip"
    sha256 "f732c0eebe20151004311910ab767e6947037b82d3ed0f93a0789693d9f8012f"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.53.0/vault-radar_0.53.0_darwin_arm64.zip"
    sha256 "8364000f50f6d275f8f658931d3203764711beaf86ece608f1e31d88edc48a40"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.53.0/vault-radar_0.53.0_linux_amd64.zip"
    sha256 "e89a9764fcb687fff627b34c13d5b2295c2bc899e945d15c203c81e58c6c5055"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.53.0/vault-radar_0.53.0_linux_arm64.zip"
    sha256 "00f0ef9d99f0e2af0c85e0fbc8894d837239d6aa9fea70256bba8f64090d7cd5"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
