# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "2.0.0+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/2.0.0+ent/vault_2.0.0+ent_darwin_amd64.zip"
    sha256 "0d813899346b03c3ad2d1a5e07b75aa320ebdcf7cb3199d41c37868ae0b2dcf9"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/2.0.0+ent/vault_2.0.0+ent_darwin_arm64.zip"
    sha256 "2eba2d7610ea2257b5333f1dcca5c793228be8c7bdabb59301b8bb09bef86ddf"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/2.0.0+ent/vault_2.0.0+ent_linux_amd64.zip"
    sha256 "1f5b003a9a294e3abadcad2a5e9b235130ef32a1c5f8ddf7ab1f9cecb99bf452"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/2.0.0+ent/vault_2.0.0+ent_linux_arm64.zip"
    sha256 "86e15d2f40023c458cd628cf71a813470231949da66cd3d27c3ce47754457c13"
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
