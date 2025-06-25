# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.20.0+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.20.0+ent/vault_1.20.0+ent_darwin_amd64.zip"
    sha256 "c29b58d94c5fd62ce330fb4f3f8fc1a73fa1b208a6cec1b9b5dbfff5ccc453e5"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.20.0+ent/vault_1.20.0+ent_darwin_arm64.zip"
    sha256 "2be9c8ac69ca000880ca270d57c44df21b469ce3899311234518104c10fbecec"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.20.0+ent/vault_1.20.0+ent_linux_amd64.zip"
    sha256 "87b4598db1dbd3a2c31ba3e61b168d25900ac0962d508ba94e7d1e416c5c37f0"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.20.0+ent/vault_1.20.0+ent_linux_arm.zip"
    sha256 "0752a747cf2b98dc026594c24c16faa02ea1b9e0d73dc5ee5711275b3e7d3c4d"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.20.0+ent/vault_1.20.0+ent_linux_arm64.zip"
    sha256 "6979c93322f4dde9aef6f8d423e356f744013401c84e17e3a69969cadcbbf5b4"
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
