# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.21.0+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.21.0+ent/vault_1.21.0+ent_darwin_amd64.zip"
    sha256 "41dc5bd0c4c6d2645398c01a8df5aaaeb9f5384190a13f50e0dc5195b2bec324"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.21.0+ent/vault_1.21.0+ent_darwin_arm64.zip"
    sha256 "f648a93ec8eac6a51f9ad644903bed5e314cc0874410bac9aff8b93e679d873b"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.21.0+ent/vault_1.21.0+ent_linux_amd64.zip"
    sha256 "9d28fc4670b33edb3bb1a72d9907669ab3ff18621c2e1e7a29efca81b6698f0b"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.21.0+ent/vault_1.21.0+ent_linux_arm.zip"
    sha256 "55e5f27b4e650545a2a30397575de3913214f39ba16da5eddc8d8bac6479aff0"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.21.0+ent/vault_1.21.0+ent_linux_arm64.zip"
    sha256 "b976642b8e8f9df46a6432e590672417f3130bc77a525421a6766234d3d809d7"
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
