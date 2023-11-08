# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.15.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.15.2/vault_1.15.2_darwin_amd64.zip"
    sha256 "aba6fb4f7f19ff242f8a25eed538e6a5ea15029575e803fe0269fbc9ac9154f5"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.15.2/vault_1.15.2_darwin_arm64.zip"
    sha256 "cbb818c3ed2371d730817324d3e9c93faf1b951cb0f6824f23b248f2ea8fde66"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.15.2/vault_1.15.2_linux_amd64.zip"
    sha256 "5a0820943bc212713ba57a5136b5ec96dd1a6fc5a1c61666407d996027b2e694"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.15.2/vault_1.15.2_linux_arm.zip"
    sha256 "2fbfd3a54952c140a5276f85dd63137eed1b004936ad1a6b9859af88d0ad2fd0"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.15.2/vault_1.15.2_linux_arm64.zip"
    sha256 "02438725b1229ad32788e05daca8d4537d4dd3d0faf4d7cb891c12e1fb40c08d"
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
