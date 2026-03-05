# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.21.4+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.21.4+ent/vault_1.21.4+ent_darwin_amd64.zip"
    sha256 "5ed135d6f9850988837bf8ab39d89f2215850ad383c4939f255014a0dbf41c61"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.21.4+ent/vault_1.21.4+ent_darwin_arm64.zip"
    sha256 "94b1abe944b34273aefd56bb20959d68f9457cd8b5805a6b38dad4e22833b922"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.21.4+ent/vault_1.21.4+ent_linux_amd64.zip"
    sha256 "9644574bd5c5615b552a0b2286e6bd688529c010bc684d9e3ef1c76054347963"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.21.1+ent/vault_1.21.1+ent_linux_arm.zip"
    sha256 "b3c0e3207c24d7533e382a52462482d282227f451e5eed9916103a9284302cf5"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.21.4+ent/vault_1.21.4+ent_linux_arm64.zip"
    sha256 "a466e851cd926a15b4584d7e890a494e9cebdff137c835fb82c3e775351c2527"
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
