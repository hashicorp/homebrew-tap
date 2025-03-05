# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.19.0+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.19.0+ent/vault_1.19.0+ent_darwin_amd64.zip"
    sha256 "8870d0c4bf6b6f1062de5f059739b98542204d2c834664053c725eeefb2108c6"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.19.0+ent/vault_1.19.0+ent_darwin_arm64.zip"
    sha256 "fba667f046e91be51fcd2ecbf7dfd7f523d2907ff278daac7315f6611dfa2d1b"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.19.0+ent/vault_1.19.0+ent_linux_amd64.zip"
    sha256 "fdbf8132c1d6e8f26c884fc2763eeb872ce122408732606d94f2f6a46a4b4768"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.19.0+ent/vault_1.19.0+ent_linux_arm.zip"
    sha256 "c29a8ab58dd9923483c4469707fa47a213e50c1dae2a1581e19db8b459e90762"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.19.0+ent/vault_1.19.0+ent_linux_arm64.zip"
    sha256 "a56f97c0994c54c3aa3cc73cc41a3c2689a8ed1bfe3e1cdea94a1b227da7f1af"
  end

  conflicts_with "vault-enterprise"

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
