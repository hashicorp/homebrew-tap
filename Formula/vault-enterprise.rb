# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.15.1+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.15.1+ent/vault_1.15.1+ent_darwin_amd64.zip"
    sha256 "10fe7a8b84ba4a5f1a960033a3beeeda9183bad1cf086cd08dd5af8d295ecfbf"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.15.1+ent/vault_1.15.1+ent_darwin_arm64.zip"
    sha256 "152d9cb3ce34566f8ad392a92a14e8035512b2a375c7dadf80e842f70e3aaada"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.15.1+ent/vault_1.15.1+ent_linux_amd64.zip"
    sha256 "87983dc0b0934ca46081f9e0c6074be4e54e6870cfeaeecadd22bf25a61d1580"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.15.1+ent/vault_1.15.1+ent_linux_arm.zip"
    sha256 "dbdfe34e41ef85e3e2f38066147eb25640dec8c9d304a0a7e5cede619d029fd8"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.15.1+ent/vault_1.15.1+ent_linux_arm64.zip"
    sha256 "1662b7bf46bed22390d6a7a2f4ddcbd9ee24a1d5ca5dbd2075017869d1bc2497"
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
