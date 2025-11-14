# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.37.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.37.0/vault-radar_0.37.0_darwin_amd64.zip"
    sha256 "e95e81c83773dbafddb1ffe555a0cfd2304b7de7a19c847ca929bea53a428d2f"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.37.0/vault-radar_0.37.0_darwin_arm64.zip"
    sha256 "7a898f804c8ac7bf2cf238ed083c60064f025b5685176726085b382473232c4b"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.37.0/vault-radar_0.37.0_linux_amd64.zip"
    sha256 "a19aef9b1cb903e6f61289d6129fdc8ba6aca191f01e06097c9857aa998c7a74"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.37.0/vault-radar_0.37.0_linux_arm64.zip"
    sha256 "c5bf94b983584834c4d557ac1d3661af50045b48a0c4a55d9361d77a865b6fc6"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
