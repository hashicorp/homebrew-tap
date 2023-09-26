# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.14.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.14.4/vault_1.14.4_darwin_amd64.zip"
    sha256 "84cf7214f2c2edc07f6cf6f078af55dbd69d26107642c61bc71b3d25921ef272"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.14.4/vault_1.14.4_darwin_arm64.zip"
    sha256 "29756bed598140598ece97a64e74d0480762f9ee84078338a3effbd0c9a88066"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.14.4/vault_1.14.4_linux_amd64.zip"
    sha256 "2e94ba5f3e6b361847763a4c4fba87050221e76f02c3a118605ec56155a7a3cf"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.14.4/vault_1.14.4_linux_arm.zip"
    sha256 "a70e3bf28574fed967b5fccb60a2df8b6a47e60ca074949ac7e07d87e09db864"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.14.4/vault_1.14.4_linux_arm64.zip"
    sha256 "0bd1531c9c97ccfe0fc7a0b40a7ba1d694ce00037f9048982db349eb64c948a5"
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
