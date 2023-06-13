# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.13.3+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.13.3+ent/vault_1.13.3+ent_darwin_amd64.zip"
    sha256 "a0e31b14a18ae82a389ebd917350260d2965dfb853b97fa343ba75e03a414f28"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.13.3+ent/vault_1.13.3+ent_darwin_arm64.zip"
    sha256 "ce04957bbacfcc22fd24f914cb47897638e526e9742fc7c11b97a4f516e0e2bc"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.13.3+ent/vault_1.13.3+ent_linux_amd64.zip"
    sha256 "c2a79abc33ca985231747bb493dae291edd8e69270aa2fa71aa372fad23ab722"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.13.3+ent/vault_1.13.3+ent_linux_arm.zip"
    sha256 "80e4cd40d2b007e414e624cd493db52d0e82628dee0e5b2cbe8d7b769c73beee"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.13.3+ent/vault_1.13.3+ent_linux_arm64.zip"
    sha256 "ec2171b2d106690e29cbb61f21884b5b50974e38251bb5758062fe6adeaeb223"
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
