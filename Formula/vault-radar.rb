# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.14.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.14.0/vault-radar_0.14.0_darwin_amd64.zip"
    sha256 "e2ea53ef40e60d99fb2cb7e9b53316220787938de75f1da4eda2abef66ded5d0"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.14.0/vault-radar_0.14.0_darwin_arm64.zip"
    sha256 "d99ff38d3bd9e80fdf61866531e718995e7e96582efa01895684e2acddedc140"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.14.0/vault-radar_0.14.0_linux_amd64.zip"
    sha256 "8511582b13ecadf6141707d2c379d310a9cebf75f8db33f4a1fe7e2112ae4e15"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.14.0/vault-radar_0.14.0_linux_arm64.zip"
    sha256 "6e64e38b3f933490956cb756b076f90ed214ab6521908d006dda3022c9902ec2"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
