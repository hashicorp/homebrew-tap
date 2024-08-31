# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.17.5+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.17.5+ent/vault_1.17.5+ent_darwin_amd64.zip"
    sha256 "c1e3d4284220645e65b432c66a3e49a5659eddc39ad9119b8f42b0bbf09c3344"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.17.5+ent/vault_1.17.5+ent_darwin_arm64.zip"
    sha256 "3495ad22b07d02af7181a8062090a3182e2b97abf9ca5828dca810b0558d71bc"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.17.5+ent/vault_1.17.5+ent_linux_amd64.zip"
    sha256 "5e0cfcee26530b43ba0b83401cf4d325ac48875bae8b4902ebed0729236b8dfe"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.17.5+ent/vault_1.17.5+ent_linux_arm.zip"
    sha256 "a1f1185cee2b1dc88fe6463b8acd1453e7fa52bac481fce55ca154580d3e8651"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.17.5+ent/vault_1.17.5+ent_linux_arm64.zip"
    sha256 "78d8e66f7d5f5a8defb8b767572cf704291eb0e85af27e12a19c5cf4c0ba0e9c"
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
