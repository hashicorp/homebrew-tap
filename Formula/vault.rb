# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.19.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.19.0/vault_1.19.0_darwin_amd64.zip"
    sha256 "e805a0ad63605358356226609be6673e0de87486b4f643cb975c2a3c00ad2700"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.19.0/vault_1.19.0_darwin_arm64.zip"
    sha256 "b8c2b2a2cee3214edfa2f228a9c2ff4228c60053a9a773bf638e04bf9b61911e"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.19.0/vault_1.19.0_linux_amd64.zip"
    sha256 "9df904271319452bbb37825cfe50726383037550cc04b7c2d0ab09e2f08f82a1"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.19.0/vault_1.19.0_linux_arm.zip"
    sha256 "b6b4f05afc0f96a5ee68939e6024760d9d02f516502979b3e3a090795358d795"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.19.0/vault_1.19.0_linux_arm64.zip"
    sha256 "252bf12d0ce1824860d6e06bd21b74b548eedd6a35225f12bf38482a4c78bef6"
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
