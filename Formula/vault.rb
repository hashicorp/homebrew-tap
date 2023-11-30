# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.15.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.15.3/vault_1.15.3_darwin_amd64.zip"
    sha256 "cea80a5913b4025ee3b88aacb21424d152f6fe330ed0dfe0999f4cab4592bc0b"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.15.3/vault_1.15.3_darwin_arm64.zip"
    sha256 "deb0ed6e988162ca23326342e786339161c22dd060e51116d7271ea6720c8fe5"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.15.3/vault_1.15.3_linux_amd64.zip"
    sha256 "9e2d1a2a725cfd2489cd02e6cb22079082d8224a3cc6d9ac900488c911175742"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.15.3/vault_1.15.3_linux_arm.zip"
    sha256 "d13848d9f79c3b7f15bfc95dc3e4953f40d1a56a027d5ebb2d5087a5e2c92b50"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.15.3/vault_1.15.3_linux_arm64.zip"
    sha256 "40fe704903be4a93fd27b397d6645360308680b4b4b201b81ef342fbe7610fca"
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
