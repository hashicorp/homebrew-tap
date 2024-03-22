# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.15.6+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.15.6+ent/vault_1.15.6+ent_darwin_amd64.zip"
    sha256 "e06a8669a00b4eca1f36051867052d4c06e4077702beb588f85dfeda0eae8b13"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.15.6+ent/vault_1.15.6+ent_darwin_arm64.zip"
    sha256 "a127f7f25f04f5f2f596cc8bdb93ea77cb33dd6c5fe2006b827344616b567934"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.15.6+ent/vault_1.15.6+ent_linux_amd64.zip"
    sha256 "9a5ded37655486c96fe81524f9970b8ee837cd8a48b9303df0f1ab87f7121ff6"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.15.6+ent/vault_1.15.6+ent_linux_arm.zip"
    sha256 "023c6b1a0bd5fa0490aa6141ec9d7d2d137d284ce96eb42b9867e37fd2c3d975"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.15.6+ent/vault_1.15.6+ent_linux_arm64.zip"
    sha256 "863d014f67decc60291a87a4e0658940a1c891086706ce5132eadb43d6a1e000"
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
