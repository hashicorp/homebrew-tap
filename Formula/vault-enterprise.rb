# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.18.5+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.18.5+ent/vault_1.18.5+ent_darwin_amd64.zip"
    sha256 "51bfe1270c6373713eb1a7c88fb31246909537bad2fe72611f583bb0f30d15f4"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.18.5+ent/vault_1.18.5+ent_darwin_arm64.zip"
    sha256 "c6eeebf894645dc1b3986d5be96211321715ce86f052670b871aee5012db9c86"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.18.5+ent/vault_1.18.5+ent_linux_amd64.zip"
    sha256 "ff3ef2a61c037bc354be6c3a427704f46cdce9cb33f4a41ffd01c9a419324cbf"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.18.5+ent/vault_1.18.5+ent_linux_arm.zip"
    sha256 "5290c6605691ab9c540d97d1611a705a4ad9bcf13e17eddb58171fb8f2977bf2"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.18.5+ent/vault_1.18.5+ent_linux_arm64.zip"
    sha256 "fcc84f76ab3cd676a2c3af83b9031567fe2b70f422786b0cde865239090d2ae6"
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
