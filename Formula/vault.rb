# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.15.5"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.15.5/vault_1.15.5_darwin_amd64.zip"
    sha256 "606c6b740639c74c5fb8dc973a4ffdda15711a1b005eb90cb9ffcd16b7b548dd"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.15.5/vault_1.15.5_darwin_arm64.zip"
    sha256 "2a0fb5fb1e3e610327751ea13f85fc5526fbc703339767d87d1186a40db664ab"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.15.5/vault_1.15.5_linux_amd64.zip"
    sha256 "6a370c7506a48c323743b0d81ebc6a4037ba1388c9838ef45f9eada53d7966e9"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.15.5/vault_1.15.5_linux_arm.zip"
    sha256 "5fb5bdc10a86432162ce8f706b7c5fd6ccb07fc02063bc4b10005dadffc0fb09"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.15.5/vault_1.15.5_linux_arm64.zip"
    sha256 "bfee22297a9812d703bb2b788b9fdc124b58a0ed07e50ffc74d29e526fb911bb"
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
