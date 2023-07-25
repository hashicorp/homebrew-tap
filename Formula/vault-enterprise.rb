# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.14.1+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.14.1+ent/vault_1.14.1+ent_darwin_amd64.zip"
    sha256 "01c740c3548729571ee9654f765c8461c6fa354a1c233c9840ff14efabbccae2"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.14.1+ent/vault_1.14.1+ent_darwin_arm64.zip"
    sha256 "87a3872ccd053baab8d5f9d355b8f0ee38544169d0bf195b292d24dd50a2ad1c"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.14.1+ent/vault_1.14.1+ent_linux_amd64.zip"
    sha256 "055f7e9b1d36014b16195b123a25f8e2473301b8c0f7f2c5b1ed92951364dbbd"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.14.1+ent/vault_1.14.1+ent_linux_arm.zip"
    sha256 "2b7bd5e6aae0e97a7996622e79b99e756cd4bc4dbf9b8c7bb4e11a74e90d67cc"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.14.1+ent/vault_1.14.1+ent_linux_arm64.zip"
    sha256 "e711e7f065c5fc20b40636df452778241019e75365b6e408d92052439e1efce7"
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
