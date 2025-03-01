# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.22.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.22.0/vault-radar_0.22.0_darwin_amd64.zip"
    sha256 "b5b42050aa341e454b3142da477208ac67d1d2ca2868521e52d636bf7289d9cd"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.22.0/vault-radar_0.22.0_darwin_arm64.zip"
    sha256 "22a4d5f805cfbd7510e848212a59e8e08da3fdf64d87bf600edc0ecf842f9d29"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.22.0/vault-radar_0.22.0_linux_amd64.zip"
    sha256 "5072724a156781c17e8c1b278c9c2cfd76863cf8edc84edd2f03646a12725e4b"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.22.0/vault-radar_0.22.0_linux_arm64.zip"
    sha256 "b723bac738e9d90d7d7b2d033d7023282bf083e1525c21a7a4bb08a453a1dc34"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
