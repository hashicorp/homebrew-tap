# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.41.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.41.0/vault-radar_0.41.0_darwin_amd64.zip"
    sha256 "22b1a958becca6c521ff1a53892d66c28ab22e101052c96e136ba8a8079c3441"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.41.0/vault-radar_0.41.0_darwin_arm64.zip"
    sha256 "74795841946ba54628fbfe7ad2d29ece7ff0476e509f0b02c1ebec6178637836"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.41.0/vault-radar_0.41.0_linux_amd64.zip"
    sha256 "762e15fa21016db99f02f2c0ae39a9d951ab6921b435af95de340eb2873bd853"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.41.0/vault-radar_0.41.0_linux_arm64.zip"
    sha256 "1d6fcd8879487e250d378e0f99a58c6e81d28a5661368894d0c20923dbbc304f"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
