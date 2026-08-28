# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "2.0.4+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/2.0.4+ent/vault_2.0.4+ent_darwin_amd64.zip"
    sha256 "5f2b2d89b0eb3f5e6f6d4c142c45837c37a5515fbe0613a179238eb147c32689"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/2.0.4+ent/vault_2.0.4+ent_darwin_arm64.zip"
    sha256 "7bb34caf0ff82e3885cb06fe11af2526ff190ddd2e09e720c56aaf60c481dd7d"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/2.0.4+ent/vault_2.0.4+ent_linux_amd64.zip"
    sha256 "997b3c0553774911bb4842faeeae616d8bc34bfa91ba6f1fccd5ae36e5b92b88"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/2.0.4+ent/vault_2.0.4+ent_linux_arm64.zip"
    sha256 "07acea98be629ad5668e7614a18c40c9c5e7b643f7780bfcb14a925b4251a8dc"
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
