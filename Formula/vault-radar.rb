# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class VaultRadar < Formula
  desc "Vault Radar"
  homepage "https://developer.hashicorp.com/hcp/docs/vault-radar/cli"
  version "0.56.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.56.0/vault-radar_0.56.0_darwin_amd64.zip"
    sha256 "a0eb1c1e46fa03cd32c9c7af364f1230c135ce501bc7c0b37c31bed296cdd654"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault-radar/0.56.0/vault-radar_0.56.0_darwin_arm64.zip"
    sha256 "0baac35a40168e2fb74468209624643415915ee96ea92dce8e505ff0a13c919f"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault-radar/0.56.0/vault-radar_0.56.0_linux_amd64.zip"
    sha256 "db9fc92822506b308cd885b9cad28bda99b9a422dcc6f108f8deea201a66510f"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault-radar/0.56.0/vault-radar_0.56.0_linux_arm64.zip"
    sha256 "64efca98c181356304af6e846edadc2be16930e3e2ac16add96cfad4cb145f35"
  end

  conflicts_with "vault-radar"

  def install
    bin.install "vault-radar"
  end

  test do
    system "#{bin}/vault-radar --version"
  end
end
