# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.20.4+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.20.4+ent/vault_1.20.4+ent_darwin_amd64.zip"
    sha256 "13cf77e07eb2dcdad37515bdaf03041898cfb30ab8745f23138259b52af95e63"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.20.4+ent/vault_1.20.4+ent_darwin_arm64.zip"
    sha256 "3325ec93f4182aef878ba4fe46d87a9a57f8b020c216074ee5d87d06e0f69816"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.20.4+ent/vault_1.20.4+ent_linux_amd64.zip"
    sha256 "2b1240eb9abc45940e28563ec4595db2d14072e8f42c3968aabdc4ed93f0317f"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.20.4+ent/vault_1.20.4+ent_linux_arm.zip"
    sha256 "aab19689da7480cb31a593f1bbe8c80f46da361ca0ea95c8ebef467105a9f260"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.20.4+ent/vault_1.20.4+ent_linux_arm64.zip"
    sha256 "deb051837ba79c8ce2fd4f19b8bafc72c62d3f7caa75335eb2f22204cf5bad50"
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
