# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.16.4+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.16.4+ent/vault_1.16.4+ent_darwin_amd64.zip"
    sha256 "5fd614787ada1d77c6245f4d91b9f1f3b6459abae63ae994af9cdd43299cadfe"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.16.4+ent/vault_1.16.4+ent_darwin_arm64.zip"
    sha256 "07c43e36c09c9afab110ad7afbb9b6092e3a60c90a171997da093e05bea9316e"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.16.4+ent/vault_1.16.4+ent_linux_amd64.zip"
    sha256 "91f8c9b5af9fc4ec1a935836939f6bf2d0b4ce29f2ce9a183eda1d380a505b63"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.16.4+ent/vault_1.16.4+ent_linux_arm.zip"
    sha256 "5490a210d392963c32218d23f22fcc956dedb5bcf3278c48e8d2bedb7708465d"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.16.4+ent/vault_1.16.4+ent_linux_arm64.zip"
    sha256 "46dd4eb55e160311904a4d3d9e9b6b934ad77bcf8fdba9eabf3fa7f50774bb60"
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
