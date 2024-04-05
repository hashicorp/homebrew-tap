# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.16.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.16.1/vault_1.16.1_darwin_amd64.zip"
    sha256 "212bc82d1fc9a4bdad508c48e793a0240ec43c713a970d28d557a3e1c841dad5"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.16.1/vault_1.16.1_darwin_arm64.zip"
    sha256 "b661d889eef6c46195aeb4789f6bfa9367fc15c2a1d7f390c19738117a00c493"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.16.1/vault_1.16.1_linux_amd64.zip"
    sha256 "315a1964d7003ef6de94c407a88972d45eb9b378946a53a1bbff34de1ae2d1e0"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.16.1/vault_1.16.1_linux_arm.zip"
    sha256 "afada56ff077167dacb0622b42d2fe347b2ebe1aa2ccc84884267ec2e6bf4e01"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.16.1/vault_1.16.1_linux_arm64.zip"
    sha256 "3fc4746c8dd74afdaa9201ab1b869c8764efae00e126879d36efc6c68af18daf"
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
