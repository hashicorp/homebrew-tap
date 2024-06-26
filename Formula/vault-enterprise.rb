# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.17.1+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.17.1+ent/vault_1.17.1+ent_darwin_amd64.zip"
    sha256 "03cc90e42284c331df50a4314293af28e175f9f8981cbaa1a53cdb76863d2acc"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.17.1+ent/vault_1.17.1+ent_darwin_arm64.zip"
    sha256 "91db32d949c006863b1a7267ab3774ec33fa27f8a73a5835d571b2fa9f4a4bd9"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.17.1+ent/vault_1.17.1+ent_linux_amd64.zip"
    sha256 "66051a3d5396c11cf954b47bd29da89491f63eafa143a15dcb54ba3d5bf66f80"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.17.1+ent/vault_1.17.1+ent_linux_arm.zip"
    sha256 "46291d4bac3401ee7696f96bc2e0e02c82f18ad5b5a88bf15d475fed97af99ad"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.17.1+ent/vault_1.17.1+ent_linux_arm64.zip"
    sha256 "5ce18a435d6c88e8bfe04b40dbbf46636dda0e1f26fe22f8dc26af1e976302bd"
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
