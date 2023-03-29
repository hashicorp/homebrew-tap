# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.13.0+ent.hsm.fips1402"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.13.0+ent.hsm.fips1402/vault_1.13.0+ent.hsm.fips1402_darwin_amd64.zip"
    sha256 ""
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.13.0+ent.hsm.fips1402/vault_1.13.0+ent.hsm.fips1402_darwin_arm64.zip"
    sha256 ""
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.13.0+ent.hsm.fips1402/vault_1.13.0+ent.hsm.fips1402_linux_amd64.zip"
    sha256 "44d6e233f4555c9b16dfc47abd0830987a764e0d8fe273412610d2f7fd862c50"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.13.0+ent.hsm.fips1402/vault_1.13.0+ent.hsm.fips1402_linux_arm.zip"
    sha256 ""
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.13.0+ent.hsm.fips1402/vault_1.13.0+ent.hsm.fips1402_linux_arm64.zip"
    sha256 ""
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
