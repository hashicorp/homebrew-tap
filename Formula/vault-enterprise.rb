# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.18.3+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.18.3+ent/vault_1.18.3+ent_darwin_amd64.zip"
    sha256 "9c1de415e73384a8da2c26e707338aaededc3d7dd095df7c8f988700af332f18"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.18.3+ent/vault_1.18.3+ent_darwin_arm64.zip"
    sha256 "bd8fb87b03bd7d43aabd249e80d4adab224ba6be259d24f4bb3fe5af034907a5"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.18.3+ent/vault_1.18.3+ent_linux_amd64.zip"
    sha256 "5923110b1f786e7d39f5968fc220c772b8c6dc3b97bcbab3bb76c3f1dad04ad9"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.18.3+ent/vault_1.18.3+ent_linux_arm.zip"
    sha256 "a06f6e2d2f2f36736f53b75021c20d5dabaad2dfb96ac8ec3ba5e01cdabdece8"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.18.3+ent/vault_1.18.3+ent_linux_arm64.zip"
    sha256 "46594d005a43965775dc710e0034b59309b9e0fd7f7f5e2dfa41317d61e2697d"
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
