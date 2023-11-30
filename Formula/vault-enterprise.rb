# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.15.3+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.15.3+ent/vault_1.15.3+ent_darwin_amd64.zip"
    sha256 "05fc17c14cbc3edf9af639425ac22b407fa3ac9122943ed9729cabd37a057570"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.15.3+ent/vault_1.15.3+ent_darwin_arm64.zip"
    sha256 "5a66c22174146c50511667fd0240a9840cdf1c06109d7e95cb2d9b9ae21ff5b3"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.15.3+ent/vault_1.15.3+ent_linux_amd64.zip"
    sha256 "cdf82a82bd8ae22734e3e1ad9246d0aa4cca7bd1e285d93a67f25b6fb2cb0d6a"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.15.3+ent/vault_1.15.3+ent_linux_arm.zip"
    sha256 "18920a0e3a2019b6623037f6793a5a1e034ae8a8ddf40ba780a5e336603f379e"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.15.3+ent/vault_1.15.3+ent_linux_arm64.zip"
    sha256 "0e60a3599c8bb53ec5f44f3e872c135ffbe56b24376f6562a050c115e5ca18d8"
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
