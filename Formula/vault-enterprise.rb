# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.15.0+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.15.0+ent/vault_1.15.0+ent_darwin_amd64.zip"
    sha256 "a5d6cd68b18ca60cf190c0c145a2bbaa14f51cf2647d4bb2615054b12da2442a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.15.0+ent/vault_1.15.0+ent_darwin_arm64.zip"
    sha256 "80ece6b6cc26fef3f9d5b170f84479868a170f5ee54db4e429773f14e011c446"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.15.0+ent/vault_1.15.0+ent_linux_amd64.zip"
    sha256 "7964aca9798a4329cbb3b07834b9e54236a5f02f5f67eb615f2f2bbbba80b8b6"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.15.0+ent/vault_1.15.0+ent_linux_arm.zip"
    sha256 "bab95de96aec3e1c8204eae26f7e74cd94e8aee593acbd4862d5833ec83c95e7"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.15.0+ent/vault_1.15.0+ent_linux_arm64.zip"
    sha256 "6398488336be0fa9063c127edac541d6ae9e4d1e8075cfef657ab9dac7c8196a"
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
