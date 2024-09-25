# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.17.6+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.17.6+ent/vault_1.17.6+ent_darwin_amd64.zip"
    sha256 "9c5a7da7e4b8eb5dcb5b8ea9bc332aff523003226741eeca291e69500835ac5a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.17.6+ent/vault_1.17.6+ent_darwin_arm64.zip"
    sha256 "9861b7b1a6894c4020bd5758e6984ad2e5b30f21b4a4f7946eb7e3fe07b2de77"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.17.6+ent/vault_1.17.6+ent_linux_amd64.zip"
    sha256 "6799c33c9c160a070e0cd02c257d2082cb4886ba99d98241904218eeabfdd748"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.17.6+ent/vault_1.17.6+ent_linux_arm.zip"
    sha256 "2151bf5ebc97df67b3361f6a8bc84a370b8f47faaedc7d1094306c008c427f62"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.17.6+ent/vault_1.17.6+ent_linux_arm64.zip"
    sha256 "7ddbfce2ae5cb824b513bd84ad88cbfb3f4edd7da8275edc4c3fef6b0e3c6711"
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
