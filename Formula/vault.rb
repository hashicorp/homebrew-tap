# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.17.6"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.17.6/vault_1.17.6_darwin_amd64.zip"
    sha256 "6900092b154e4d306ed24a0217c68e373b84161bf3dcc4988f401115a33fe768"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.17.6/vault_1.17.6_darwin_arm64.zip"
    sha256 "5120c28700460a74782f30ae14b1b6493e8d43fa15947ef954384bfc684a6be7"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.17.6/vault_1.17.6_linux_amd64.zip"
    sha256 "0cddc1fbbb88583b5ba5b845f9f8fae47c6fb39a6d48cd543c6ba6fd3ac1a669"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.17.6/vault_1.17.6_linux_arm.zip"
    sha256 "93f59d19ac41d3f95e36611ee2b0afc7a1ddecb7708369f88f419ced4b055c1a"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.17.6/vault_1.17.6_linux_arm64.zip"
    sha256 "05a48513fd609e26c25d6b6b74005bce3430984fe4161696236cc2226e664f3a"
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
