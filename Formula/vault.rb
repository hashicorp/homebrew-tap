# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.15.6"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.15.6/vault_1.15.6_darwin_amd64.zip"
    sha256 "deca4a807fcf402351f16598e9bba4fa2d759aa04a99d4ac2a970d174187a282"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.15.6/vault_1.15.6_darwin_arm64.zip"
    sha256 "991c61e424ba2c898f0acf970a1f07e96a4959d35168b351a2144684be9b1576"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.15.6/vault_1.15.6_linux_amd64.zip"
    sha256 "e5286f2f66a76972d1dd60a9cfb79e9e571c39a4531e89ac0b23a6a9147e6ee9"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.15.6/vault_1.15.6_linux_arm.zip"
    sha256 "073ab13f7a40c50668f9f9bf802db1b683a4131b186c2f28566ca2a293ab2472"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.15.6/vault_1.15.6_linux_arm64.zip"
    sha256 "755b5bdff9db6ffa7beb6dd0d7dbe4d367820630f5a5c88a885444fbbce32a73"
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
