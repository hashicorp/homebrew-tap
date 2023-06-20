# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.14.0+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.14.0+ent/vault_1.14.0+ent_darwin_amd64.zip"
    sha256 "52f900ef02945197b9630ab668ee526a8a2fd16167e0d78487e0e3f21aa240c8"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.14.0+ent/vault_1.14.0+ent_darwin_arm64.zip"
    sha256 "98157572a766ce826a662555a3a85db29691ceda904e6ce13eb192ee7134545a"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.14.0+ent/vault_1.14.0+ent_linux_amd64.zip"
    sha256 "8ae668fe379e48827bb1d1734447cf7900ee522107ce25922314b3b22272fcfa"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.14.0+ent/vault_1.14.0+ent_linux_arm.zip"
    sha256 "77b21b08fe15fe6c29bc070488e03852b7924aa0f59108389ca86093e9b32fbd"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.14.0+ent/vault_1.14.0+ent_linux_arm64.zip"
    sha256 "8fcf843efc664c56b53d1700655529342b49ea247a894f90fe1f644c84c0b536"
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
