# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.16.2+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.16.2+ent/vault_1.16.2+ent_darwin_amd64.zip"
    sha256 "2a3df0d4c66a33e967e15c918b719fbd463fa6b43276545e8dc18f7e47f2fa2d"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.16.2+ent/vault_1.16.2+ent_darwin_arm64.zip"
    sha256 "6afccc7ba6c47225a91697b60bbdcaf72e6cd930b5e2a43a161d32663acc13bd"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.16.2+ent/vault_1.16.2+ent_linux_amd64.zip"
    sha256 "6368943598de0f4073a94128ff68bfaec94fc8fccf3981140d37846a38f4e300"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.16.2+ent/vault_1.16.2+ent_linux_arm.zip"
    sha256 "0ff1462e1984e2b0851f448b59b29bca4c8b01d39be9b21982dbe315bf44e0f5"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.16.2+ent/vault_1.16.2+ent_linux_arm64.zip"
    sha256 "567876aab0d3d60dca0f7e39176f367cacea98a45b08bdb00598d3ffb83f5863"
  end

  conflicts_with "vault-enterprise"

  def install
    bin.install "vault"
  end

  service do
    run [bin/"vault", "server", "-dev"]
    keep_alive successful_exit: false
    working_dir var
    log_path var/"log/vault.log"
    error_log_path var/"log/vault.log"
  end

  test do
    system "#{bin}/vault --version"
  end
end
