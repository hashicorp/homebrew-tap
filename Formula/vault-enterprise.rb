# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.17.0+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.17.0+ent/vault_1.17.0+ent_darwin_amd64.zip"
    sha256 "4e0b3c23a420a35c35f954c9c9dcd412de31c5d59c493f8a8d5e92d2a67fced2"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.17.0+ent/vault_1.17.0+ent_darwin_arm64.zip"
    sha256 "2168bbc74dbea1fdcc1ab2fdaad5e1b53d53245cb4591ebdf23e7faed2fef6dd"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.17.0+ent/vault_1.17.0+ent_linux_amd64.zip"
    sha256 "813ee332b4d22381305b465858e9636c3aa33548d3b02444d4339b06ff7b5d5b"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.17.0+ent/vault_1.17.0+ent_linux_arm.zip"
    sha256 "ce3060ee9651e4880f4620cbd7db0f6b0103eb7e5ff61329460654a899ab69a7"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.17.0+ent/vault_1.17.0+ent_linux_arm64.zip"
    sha256 "75b4579b7723ecc6e75dc57f47951385bc9794bba7a69846adcc8fa12c03dc32"
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
