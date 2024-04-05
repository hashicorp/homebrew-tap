# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.16.1+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.16.1+ent/vault_1.16.1+ent_darwin_amd64.zip"
    sha256 "492da0f496a1d1589fe958fa035f5a5f7975cce5d32fa095a94ab60851f7019a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.16.1+ent/vault_1.16.1+ent_darwin_arm64.zip"
    sha256 "f711dc457968ceacefa8e6a33cd963cebe55db09c22fb6802b3702ca43889e94"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.16.1+ent/vault_1.16.1+ent_linux_amd64.zip"
    sha256 "88dbf713f1c520e8cd8709e15e1682d01aa138fb43a97e943a29bfa6c079c50f"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.16.1+ent/vault_1.16.1+ent_linux_arm.zip"
    sha256 "eab4bf7857d3d82fcdf3f33e7da92245f406fab1c21a23140343da931cd53766"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.16.1+ent/vault_1.16.1+ent_linux_arm64.zip"
    sha256 "63ba22573a82ac3dad1dd75a3778394d7f96b6dd1c2a66614bd82e3000475cd7"
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
