# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.15.2+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.15.2+ent/vault_1.15.2+ent_darwin_amd64.zip"
    sha256 "be6569df6f66fb8e7dc256204e2b5fb9952f5f78ffefdd2fe3587f70c82b007a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.15.2+ent/vault_1.15.2+ent_darwin_arm64.zip"
    sha256 "898d3980f6416ee7dd309c2d815af30340a19d9aa300095ab1dc408abf57038d"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.15.2+ent/vault_1.15.2+ent_linux_amd64.zip"
    sha256 "0306ba125aaf15b91c06c1fa744aab853ee2e41565aa1bf4a0396f8d3404f9ad"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.15.2+ent/vault_1.15.2+ent_linux_arm.zip"
    sha256 "f003cfc224c50717c570ec34fd4e49e34e2474d0c51025fee34f5f219be14093"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.15.2+ent/vault_1.15.2+ent_linux_arm64.zip"
    sha256 "bca338c6a3b7d4fd52b4fa075c721a80c72b449d6233ef0015da8c06e70eb855"
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
