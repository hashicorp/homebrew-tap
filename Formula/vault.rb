# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.15.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.15.0/vault_1.15.0_darwin_amd64.zip"
    sha256 "00183990c3af5e127b755b0af301e188e02833d4b1567e96712d82aa47e9bd7f"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.15.0/vault_1.15.0_darwin_arm64.zip"
    sha256 "7f5a5b8ea30521f5bf918a762ba47f1c1fec6934130844643e996e41ff016369"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.15.0/vault_1.15.0_linux_amd64.zip"
    sha256 "b69c209f05c1ccfa012a60090adfca1607c8fad14728a5a208979a1706b6cd46"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.15.0/vault_1.15.0_linux_arm.zip"
    sha256 "2bd84fa3719f4f75f389aeccaa2ce7e6104bfaf427328ed124c10d39011602d7"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.15.0/vault_1.15.0_linux_arm64.zip"
    sha256 "59f9349e6897fd0f89790fb81780944cab84f4507aa259494013c24db6d083bb"
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
