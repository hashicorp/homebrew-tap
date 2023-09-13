# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.14.3+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.14.3+ent/vault_1.14.3+ent_darwin_amd64.zip"
    sha256 "6480d3bf70628730fd1f3495e4eabdd4b76bd36764d0c082f3e52d06d3eefa88"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.14.3+ent/vault_1.14.3+ent_darwin_arm64.zip"
    sha256 "f98eab23b7c132ec35031762aae735a52c4fa17a8d42b83452930f50b11a88d1"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.14.3+ent/vault_1.14.3+ent_linux_amd64.zip"
    sha256 "ee64fc7343f4d14678e9a04721d6130a6aa3eabb07bbdf0dd9c907de287d9036"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.14.3+ent/vault_1.14.3+ent_linux_arm.zip"
    sha256 "b6c5ba0f4bec246a48be65acb6731ddc9127571956efdc4972142c72fe157c6a"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.14.3+ent/vault_1.14.3+ent_linux_arm64.zip"
    sha256 "e7729c79efebd8d214d241fef6496820c60c0d08573d060c83549c884365bbe8"
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
