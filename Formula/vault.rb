# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.14.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.14.2/vault_1.14.2_darwin_amd64.zip"
    sha256 "af2c8989ab351aa98d39b1448e041c96d1b921da328e9a41bc751f366e493e83"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.14.2/vault_1.14.2_darwin_arm64.zip"
    sha256 "6ad0916053e2bcb5523b961140bef6566a2187fd759e8b7f00cbfa22b0bd998c"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.14.2/vault_1.14.2_linux_amd64.zip"
    sha256 "134a4b8d9473722b2d37d4677e8e5c7e18f5010f8866c4bbb84e2cef3daea532"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.14.2/vault_1.14.2_linux_arm.zip"
    sha256 "3fc3fabf71ddcdf62fb90a261e0db7fcc5315faa59469e0ce9744e0cf34143b3"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.14.2/vault_1.14.2_linux_arm64.zip"
    sha256 "ce4c5eb14c1362a2513d60592b91b3b3a0076bd564df90d1ba2c675b3a719717"
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
