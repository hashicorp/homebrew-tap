# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.17.4+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.17.4+ent/vault_1.17.4+ent_darwin_amd64.zip"
    sha256 "fb90a789285ac8be75247b75522088bcc381a013fe34dc76d3f533aa47239820"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.17.4+ent/vault_1.17.4+ent_darwin_arm64.zip"
    sha256 "9c5eeb7452727e22ecb027163e6e3297f2ff29013b5c7e34b0632a67c31282c6"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.17.4+ent/vault_1.17.4+ent_linux_amd64.zip"
    sha256 "db4ea80d450021a4bae7063c6d3a56ba07e57b3af4fdb39223641ee117762037"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.17.4+ent/vault_1.17.4+ent_linux_arm.zip"
    sha256 "898575b2e3bf103c83fc7d98281992c584b83d733b3f5299e1638e7a5442e514"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.17.4+ent/vault_1.17.4+ent_linux_arm64.zip"
    sha256 "d7bcac3954517b9c17e4f1ec81b23325e0e31223827a23b818e84bc4c34675cc"
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
