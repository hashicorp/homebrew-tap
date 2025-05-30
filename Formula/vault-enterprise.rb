# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.19.5+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.19.5+ent/vault_1.19.5+ent_darwin_amd64.zip"
    sha256 "34d3e1d33ec0a7a2910490ddbb545cebb39b451194e70dae353c259dc4467bfb"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.19.5+ent/vault_1.19.5+ent_darwin_arm64.zip"
    sha256 "e00060aee19c54c8a2a46e200680cfbfdf9f477214ff99b012312f6dbdf6fe56"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.19.5+ent/vault_1.19.5+ent_linux_amd64.zip"
    sha256 "cc90130315eed6e37ed2fa1f54d6dc2433dd2aaeb278bcfe5351450b21591ea1"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.19.5+ent/vault_1.19.5+ent_linux_arm.zip"
    sha256 "a0e011419d2a40c370c8c1fcdad90269d4e75262bb1535054f861fe731413773"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.19.5+ent/vault_1.19.5+ent_linux_arm64.zip"
    sha256 "7a0be8f82f8fac4d28e966b03c502a7ae2b408e61ea557bc063974c074a40098"
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
