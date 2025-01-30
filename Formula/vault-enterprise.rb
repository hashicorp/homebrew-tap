# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.18.4+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.18.4+ent/vault_1.18.4+ent_darwin_amd64.zip"
    sha256 "817f34ef435d4329a0f156d5cd742862ea155eaee1358c5cc4da98e6fbcd1377"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.18.4+ent/vault_1.18.4+ent_darwin_arm64.zip"
    sha256 "a5cedd204b3d954a738f94f31d10add88182817fd14d8d00291010d8b56fb383"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.18.4+ent/vault_1.18.4+ent_linux_amd64.zip"
    sha256 "1e98ea005e47f737340102654b7e988e09a81438f61f845d42a5d08d3a5cf6ab"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.18.4+ent/vault_1.18.4+ent_linux_arm.zip"
    sha256 "51fb98bf20e131abf27c995ecaa48375f0cc8b6fc93ce7e2d83a5d786bb183b8"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.18.4+ent/vault_1.18.4+ent_linux_arm64.zip"
    sha256 "eb6124bf208c95dfeefe58760b59e03682c2b85894f44fac28c9d4005476aac6"
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
