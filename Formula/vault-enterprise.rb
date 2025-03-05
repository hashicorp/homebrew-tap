# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.18.6+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.18.6+ent/vault_1.18.6+ent_darwin_amd64.zip"
    sha256 "97cf6d12940f7fd3cf2d95d3ed2faf5e08141f79fe24154f8becf5aa9484d42d"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.18.6+ent/vault_1.18.6+ent_darwin_arm64.zip"
    sha256 "41e8aee6d3669cc4766739e6645d6c6b15f269df6dc13b102474d56709d3511d"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.18.6+ent/vault_1.18.6+ent_linux_amd64.zip"
    sha256 "25ca785974b02887bf7a73eb69f09b863a8376d7743cdb11be98056e7f14a55b"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.18.6+ent/vault_1.18.6+ent_linux_arm.zip"
    sha256 "2f8c027c351b66babe143567557e77a711dd208baf15289cc493a0acb6bab146"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.18.6+ent/vault_1.18.6+ent_linux_arm64.zip"
    sha256 "53f93aee4b3b4b540d6324defa667894c6870145bb5e6513c37f9026c8b35aba"
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
