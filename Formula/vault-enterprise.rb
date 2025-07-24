# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.20.1+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.20.1+ent/vault_1.20.1+ent_darwin_amd64.zip"
    sha256 "91c190a394dd1904c0d035f913e2b3bd329f608e85cb77aadb9e91efd8b74ed6"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.20.1+ent/vault_1.20.1+ent_darwin_arm64.zip"
    sha256 "88686d048ec0b08fbb0ee36f82e291debde2f68418f10d20432cbfc8ada592f7"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.20.1+ent/vault_1.20.1+ent_linux_amd64.zip"
    sha256 "bb70dabe2a32383aa1a07c7249961d0399cf7a0d436ae74c7a0a070f2837781e"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.20.1+ent/vault_1.20.1+ent_linux_arm.zip"
    sha256 "6bf97c0082cbbeccd619b97f87314c018c517a3f8274f55cf8f4da1c21572a2f"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.20.1+ent/vault_1.20.1+ent_linux_arm64.zip"
    sha256 "e13d49bccc4199638074671c5691289271739ae2b23f13e54d95b3b510e11591"
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
