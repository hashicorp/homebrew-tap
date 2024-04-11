# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Sentinel < Formula
  desc ""
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.5.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.5.0/vault-radar_0.5.0_darwin_amd64.zip"
    sha256 "ffa95d69068463e56be6eb2b7cb24a6c64256fca143095e68902d28bf569617c"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.5.0/vault-radar_0.5.0_darwin_arm64.zip"
    sha256 "a2bd0f17aff87ced18d3c7ecb2be32cec88777639171c4a69a6ac328933daa97"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.18.0/sentinel_0.18.0_linux_amd64.zip"
    sha256 "58c0202cc593efcf1198b6d79ab7e90d903edcfe104a093ca821865d86085cb8"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.5.0/vault-radar_0.5.0_linux_arm64.zip"
    sha256 "28df2973b3e68957163487d0dc1d1e34bba6f98f134e7dfc5276e59f79bf02c1"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
