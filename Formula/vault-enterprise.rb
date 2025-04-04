# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.19.1+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.19.1+ent/vault_1.19.1+ent_darwin_amd64.zip"
    sha256 "cd080087a8d254e60eb82aeafe49a0116c5aa8a456acc218194d633708dfaf0d"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.19.1+ent/vault_1.19.1+ent_darwin_arm64.zip"
    sha256 "c12e05faf1a3decd1710f784a67782a1fb0b7ce31b3cbc899aa97a5f377d5687"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.19.1+ent/vault_1.19.1+ent_linux_amd64.zip"
    sha256 "0d773c41b3b03885f39c766b6583a5aa138838865cc773fe9a3b9e6494e6030f"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.19.1+ent/vault_1.19.1+ent_linux_arm.zip"
    sha256 "f21e7b82be4b56c28828f439da7935e19bca00fb610d31b1e5842d1daa7e80b3"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.19.1+ent/vault_1.19.1+ent_linux_arm64.zip"
    sha256 "ec072286fd796a6577b6c2aa816a525888837207e6098acc07bd233adf0cf12a"
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
