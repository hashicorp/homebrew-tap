# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "2.0.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/2.0.0/vault_2.0.0_darwin_amd64.zip"
    sha256 "4fe88b981fcf14917a5f1b1c1ffaf4f9231c3f646ab778ba44e71dfb80e5b234"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/2.0.0/vault_2.0.0_darwin_arm64.zip"
    sha256 "3b8ad2cc6de8b6cc13e030465e83729aec1070ef91327a55be0a28af81a530bf"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/2.0.0/vault_2.0.0_linux_amd64.zip"
    sha256 "0367bdd46dd1fff1ff19fc44e60df48866515bb519c80527236b3808ea879ac2"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/2.0.0/vault_2.0.0_linux_arm64.zip"
    sha256 "5f04207fd0fbabbb8c6cca494fdee96f81bb0a82e1176670649e1aeeaadf0281"
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
