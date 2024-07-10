# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.17.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.17.2/vault_1.17.2_darwin_amd64.zip"
    sha256 "3fde3001f454b853a6ab5155046866fe15192ec82e323f11c93cfcf67ed1e7b1"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.17.2/vault_1.17.2_darwin_arm64.zip"
    sha256 "db43a2a5654b238424f55264231e33122c2180dbf86419b836d18dcc7ba66d3f"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.17.2/vault_1.17.2_linux_amd64.zip"
    sha256 "a0c0449e640c8be5dcf7b7b093d5884f6a85406dbb86bbad0ea06becad5aaab8"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.17.2/vault_1.17.2_linux_arm.zip"
    sha256 "e8fa3d269cf90cdaa6e8b4c7e9172c45dce87d0a96f04b041016e9d97c7b9bdc"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.17.2/vault_1.17.2_linux_arm64.zip"
    sha256 "1cdfd33e218ef145dbc3d71ac4164b89e453ff81b780ed178274bc1ba070e6e9"
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
