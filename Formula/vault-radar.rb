# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.24.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.24.0/vault-radar_0.24.0_darwin_amd64.zip"
    sha256 "9eb00f9814806dfaf61e0b4b6432871ad04a6596686648e04630bc971d2b6661"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.24.0/vault-radar_0.24.0_darwin_arm64.zip"
    sha256 "24aec59171dffc741e2c1255ed77094b241fda0cfce59e9a6b004c668435382a"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.24.0/vault-radar_0.24.0_linux_amd64.zip"
    sha256 "53cd40e9acf10edd00e35721cadac519b787eeb94b4d62553b753eb87aabfb64"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.24.0/vault-radar_0.24.0_linux_arm64.zip"
    sha256 "216a9942802662a3d1a9d481ea9dab1692b79afcc7f23147f7fc94621bb190d8"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
