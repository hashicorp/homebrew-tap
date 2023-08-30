# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.14.2+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.14.2+ent/vault_1.14.2+ent_darwin_amd64.zip"
    sha256 "75e215e490ff2d512065df8f2e95fb1cd69c546a3ec615f298b45d643ba9e150"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.14.2+ent/vault_1.14.2+ent_darwin_arm64.zip"
    sha256 "77aa30a30dc38f7cdb8932dec04dcbf2d007bddaef49e2dce60b362ee5b451e8"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.14.2+ent/vault_1.14.2+ent_linux_amd64.zip"
    sha256 "0bd7748a65fa860a2bcf005e83f1efc36a2c7428bf6e9434dc7f64d7b3de0f13"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.14.2+ent/vault_1.14.2+ent_linux_arm.zip"
    sha256 "8cf8f20d6f8734e54a5847c89e69487e8e56e6cb8a8f6e32d6ff4f1f1e55fab7"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.14.2+ent/vault_1.14.2+ent_linux_arm64.zip"
    sha256 "adfa4b5d75c305e3d6314b76caeefb5c14c82fac55cbaf50f1083fae4f54161d"
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
