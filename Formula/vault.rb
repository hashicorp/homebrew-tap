# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.13.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.13.1/vault_1.13.1_darwin_amd64.zip"
    sha256 "1e36bf545cb0e0bbe74071e78a342460e38ed8e9572b22045c3c83d60f9e2c66"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.13.1/vault_1.13.1_darwin_arm64.zip"
    sha256 "9825b87faf467f2ea391124b54a0f7504ffaea9e29978bab52313b0fadadb51d"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.13.1/vault_1.13.1_linux_amd64.zip"
    sha256 "cf1015d0b30806515120d4a86672ea77da1fb0559e3839ba88d8e02e94e796a6"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.13.1/vault_1.13.1_linux_arm.zip"
    sha256 "93d72f8588c65dbf4bd7b163a0eeaed3a24837c7c507339401619bec30acde72"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.13.1/vault_1.13.1_linux_arm64.zip"
    sha256 "8a247a78dd636b3cdc01d7612f81c4cf770260af53e64e906f726a671e6f2a1f"
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
