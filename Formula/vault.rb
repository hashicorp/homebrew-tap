# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.15.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.15.4/vault_1.15.4_darwin_amd64.zip"
    sha256 "a9d7c6e76d7d5c9be546e9a74860b98db6486fc0df095d8b00bc7f63fb1f6c1c"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.15.4/vault_1.15.4_darwin_arm64.zip"
    sha256 "4bf594a231bef07fbcfbf7329c8004acb8d219ce6a7aff186e0bac7027a0ab25"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.15.4/vault_1.15.4_linux_amd64.zip"
    sha256 "f42f550713e87cceef2f29a4e2b754491697475e3d26c0c5616314e40edd8e1b"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.15.4/vault_1.15.4_linux_arm.zip"
    sha256 "5b2428e6af56d7e9f4fa2a2cc840091035407be8e79adf07a6eb7c30f97f7a12"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.15.4/vault_1.15.4_linux_arm64.zip"
    sha256 "79aee168078eb8c0dbb31c283e1136a7575f59fe36fccbb1f1ef6a16e0b67fdb"
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
