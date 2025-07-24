# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.20.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.20.1/vault_1.20.1_darwin_amd64.zip"
    sha256 "9e110059908377febc2cc4e723f8f6bc825030dbae563e6747db7d28c56f3296"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.20.1/vault_1.20.1_darwin_arm64.zip"
    sha256 "3e82186552264a3d15f9933d0a80319f595c6aecda9bbe6c3b48beee6f23d3a6"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.20.1/vault_1.20.1_linux_amd64.zip"
    sha256 "e3ce3e678421c0d56f726952ab100875168c2e1eb1db751ed5a2b25b6b2ea96f"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.20.1/vault_1.20.1_linux_arm.zip"
    sha256 "3fb938665b5bc22b1d700a08fe4e8f118168e43a6809f2d50dc7f9f4d8c62e3b"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.20.1/vault_1.20.1_linux_arm64.zip"
    sha256 "470af64c86d76ce296ed394a10adb63b43e428491c83e0f7180e9903d41ff39d"
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
