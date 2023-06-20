# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.13.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.13.4/vault_1.13.4_darwin_amd64.zip"
    sha256 "642fa08aef99bd0859c610e471b02bf4d432b1661ab20690bdd17f9a52b1de3e"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.13.4/vault_1.13.4_darwin_arm64.zip"
    sha256 "2b94c7295697500f55a804b2751798b2a0d7df32b69542ff757c7c05499c50ce"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.13.4/vault_1.13.4_linux_amd64.zip"
    sha256 "ca9975ecfb27bc0bc29cf0433e436924c2a2b51737cafb8814b50ab5d893b46f"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.13.4/vault_1.13.4_linux_arm.zip"
    sha256 "5a071ac2bb72a7793f9ba3a3df65283558a3bc8965946a7acb7db62ebae715e1"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.13.4/vault_1.13.4_linux_arm64.zip"
    sha256 "10ed0125334c36362d4058d599bb0ee707696648677c59ec4e7644156049fbfb"
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
