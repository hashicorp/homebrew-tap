# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.14.4+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.14.4+ent/vault_1.14.4+ent_darwin_amd64.zip"
    sha256 "83611b40a70ff3106e32838685f1ade844b821e02080b6749fd5f5b7ea3cdbd5"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.14.4+ent/vault_1.14.4+ent_darwin_arm64.zip"
    sha256 "36641359514276074dd3b3208780b28dd9d77bf809b91c5350e436724ce609e8"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.14.4+ent/vault_1.14.4+ent_linux_amd64.zip"
    sha256 "d32de05e5df25c93e4b5430c5ae91aac51505b222533c728b4c1e09d576e647e"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.14.4+ent/vault_1.14.4+ent_linux_arm.zip"
    sha256 "68b136677283bdb9c34b769bb439277d91ad3c6f360e13ef0b5a5912f22b6097"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.14.4+ent/vault_1.14.4+ent_linux_arm64.zip"
    sha256 "cd7ea49604e630bfd554bf7fcf89f55764e16fec2ccdfd53898e6e20345e1768"
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
