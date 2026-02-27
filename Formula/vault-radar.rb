# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.43.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.43.0/vault-radar_0.43.0_darwin_amd64.zip"
    sha256 "b700580a9804b2e48db3e0573be9361d2c32bb620af6d50fdf5dc49ab6033a13"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.43.0/vault-radar_0.43.0_darwin_arm64.zip"
    sha256 "b26882e151794c94b60f2f4ede2932fa4641bef65287041f159ebe9ba352d9f9"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.43.0/vault-radar_0.43.0_linux_amd64.zip"
    sha256 "0bac898352d07fa3b995b55263311b683b60185024a260966c0722920c72d887"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.43.0/vault-radar_0.43.0_linux_arm64.zip"
    sha256 "6a1cb912c86f86c390852a23851fcf4f2c85f27c203b5025824b73eea2b60907"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
