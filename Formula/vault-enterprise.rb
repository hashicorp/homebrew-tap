# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.19.2+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.19.2+ent/vault_1.19.2+ent_darwin_amd64.zip"
    sha256 "f857169d152ab445c79358b5fdcdd4d194fa7854316ab430aa7ca3cdfa0d5d60"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.19.2+ent/vault_1.19.2+ent_darwin_arm64.zip"
    sha256 "6af3f4e04e3a282c03deeedb7d0e3c11c4a7ae793c9ff2e0505f61257dadf406"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.19.2+ent/vault_1.19.2+ent_linux_amd64.zip"
    sha256 "5ff9fd20728f55128ce0c55602e72bc8310b0e5ed06f1142b6909dfb7f549cd1"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.19.2+ent/vault_1.19.2+ent_linux_arm.zip"
    sha256 "18c465feae422dc5ae76b018917af61dcfee57a436d9be2bae8200a103f0aa52"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.19.2+ent/vault_1.19.2+ent_linux_arm64.zip"
    sha256 "251be28653c4c06850bc93498d94af39d8b723d324a5a2c7970b43c1fed759fc"
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
