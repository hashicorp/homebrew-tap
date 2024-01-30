# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.15.5+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.15.5+ent/vault_1.15.5+ent_darwin_amd64.zip"
    sha256 "f34a850cb6b00687d045d2b1037b72db956f1be394d5e5f469724d9257348da0"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.15.5+ent/vault_1.15.5+ent_darwin_arm64.zip"
    sha256 "109f7c98cc667ab2d7d861525aa5b0d222f267ca5130dcd8d926014a66d42783"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.15.5+ent/vault_1.15.5+ent_linux_amd64.zip"
    sha256 "9ccf77863fc0079e0ddd70f4d4843132d8786a4ee2f7b015bfc92b69f1c88325"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.15.5+ent/vault_1.15.5+ent_linux_arm.zip"
    sha256 "d49b5e96050d0e80a60f3435837e6681993c7531cc0b28eb790692743ed9fc43"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.15.5+ent/vault_1.15.5+ent_linux_arm64.zip"
    sha256 "a5c249e05b3a04498f9e62cbb5c49c115638c4403477734656e9bd4d67ba35b2"
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
