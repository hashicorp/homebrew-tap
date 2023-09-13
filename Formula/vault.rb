# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.14.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.14.3/vault_1.14.3_darwin_amd64.zip"
    sha256 "17cc20567ad77ff64846900cbd610e1c07f37223d80227f990d6dcce741d5bc1"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.14.3/vault_1.14.3_darwin_arm64.zip"
    sha256 "ec968d71ccef22bf586cafa68e07d358b343c27744fd180270baca7611471da8"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.14.3/vault_1.14.3_linux_amd64.zip"
    sha256 "01e1698d2563cf4780438468f9f815eedf707e8ea01f87bb7621e24a00e21d12"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.14.3/vault_1.14.3_linux_arm.zip"
    sha256 "3843e319e853fa4f23ba59237e4f5481b0ba0fea0836da1e91c7d713b50dc1ca"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.14.3/vault_1.14.3_linux_arm64.zip"
    sha256 "326922155685ab17e659e921e0e66af2694b9743005e0e73c917e5d19408986d"
  end

  conflicts_with "vault"

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
