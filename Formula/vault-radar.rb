# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.6.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.6.0/vault-radar_0.6.0_darwin_amd64.zip"
    sha256 "d7b4a0d662ab574a122a2ab0057fe17203a389c4856fead4e5cbcea3195e4c9d"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.6.0/vault-radar_0.6.0_darwin_arm64.zip"
    sha256 "f5df9ab542fff33735ee8857f40e68e07a018df2005dfbe8aea52ae441ef39c7"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.6.0/vault-radar_0.6.0_linux_amd64.zip"
    sha256 "fff741226d5f140955874c9d1104feb1ee7e56820814a1c4d2e0b4164b0c0184"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.6.0/vault-radar_0.6.0_linux_arm64.zip"
    sha256 "8849f23e3ee9b0e7ff98f459bf7c666bcb971f9d91df81774bd897c9a512c3a0"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
