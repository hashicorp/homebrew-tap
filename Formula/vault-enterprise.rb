# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "2.0.3+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/2.0.3+ent/vault_2.0.3+ent_darwin_amd64.zip"
    sha256 "9816c92cc9c3a5130dc020b88febcf546f650e88986624df33aae29729b7c33f"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/2.0.3+ent/vault_2.0.3+ent_darwin_arm64.zip"
    sha256 "67616d1e41e75dcb00f79bf5a3c43e22cc29dba4a834854e6b14c8f6ef3a1021"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/2.0.3+ent/vault_2.0.3+ent_linux_amd64.zip"
    sha256 "14239bce32f4826c7bc0b563dc67f46cc21db3854897997fcabb5e8339c87428"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/2.0.3+ent/vault_2.0.3+ent_linux_arm64.zip"
    sha256 "5f0b8436c3e30d2d22d8e45c01a6f8755ec38f207894a4d13b05b751c09ea634"
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
