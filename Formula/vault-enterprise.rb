# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.19.3+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.19.3+ent/vault_1.19.3+ent_darwin_amd64.zip"
    sha256 "d2a176890b4e9da3c3cd5ccb46b7136459c7bf1017a636bdeb597f042bede875"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.19.3+ent/vault_1.19.3+ent_darwin_arm64.zip"
    sha256 "43bb0f737a2cedd8b51d70e605e3333d8f1bb7f3e4eee87ed296bd1a117c2ffe"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.19.3+ent/vault_1.19.3+ent_linux_amd64.zip"
    sha256 "c6efe0596855d14e0f4b5d45f48a35a81144ab20b4e0fb9a7bb3cc52ec2965c0"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.19.3+ent/vault_1.19.3+ent_linux_arm.zip"
    sha256 "245ff79c65314b26883c76ae11b2da8cc8a224f203830f95d434f1cfe2c96476"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.19.3+ent/vault_1.19.3+ent_linux_arm64.zip"
    sha256 "e8ac90d4f8375e9066f18d6d01e9a39832db5c135256a7996c3627300e3c0e9a"
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
