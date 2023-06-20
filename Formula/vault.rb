# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.14.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.14.0/vault_1.14.0_darwin_amd64.zip"
    sha256 "5f1f9c548bffee8d843a08551aa018eb97ea15fd3215ecc8f97d6be3f15e29ba"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.14.0/vault_1.14.0_darwin_arm64.zip"
    sha256 "6d39460059b4a3ba723099c07f019af73687f3c05f4c390f155ad32127702fd4"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.14.0/vault_1.14.0_linux_amd64.zip"
    sha256 "3d5c27e35d8ed43d861e892fc7d8f888f2fda4319a36f344f8c09603fb184b50"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.14.0/vault_1.14.0_linux_arm.zip"
    sha256 "580248d390275ccf4aa5f01cb0cbad6acef661b234accbbfb0f333e7ffea8f87"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.14.0/vault_1.14.0_linux_arm64.zip"
    sha256 "116ed35f19b3b91a7afc9533f602cd9cdbfbb08e66c785080b0046a034b0a051"
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
