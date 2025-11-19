# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.21.1+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.21.1+ent/vault_1.21.1+ent_darwin_amd64.zip"
    sha256 "08e6623e690804d4d6ef897dcc3d168c3403b072a21a5223f2d3e70097db9135"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.21.1+ent/vault_1.21.1+ent_darwin_arm64.zip"
    sha256 "1a2e5977de77e0ccb2350879cf12133ecdf16df2f11cb4776997cc839f1a77db"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.21.1+ent/vault_1.21.1+ent_linux_amd64.zip"
    sha256 "7b6ab5c6a2b04e2c1c4f0192257eb61595ef6be04e8100ad952f096b0f038f48"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.21.1+ent/vault_1.21.1+ent_linux_arm.zip"
    sha256 "b3c0e3207c24d7533e382a52462482d282227f451e5eed9916103a9284302cf5"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.21.1+ent/vault_1.21.1+ent_linux_arm64.zip"
    sha256 "3e287c3a8ff76f6eb0499678bc2045e86ad6047d2a0cbd4b0182d5aee1efd34b"
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
