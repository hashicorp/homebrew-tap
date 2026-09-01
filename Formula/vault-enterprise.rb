# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "2.1.0+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/2.1.0+ent/vault_2.1.0+ent_darwin_amd64.zip"
    sha256 "c864ccb91ce36a12591e004ed16bcc7801772330d14ff945dff5046655a8f1e7"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/2.1.0+ent/vault_2.1.0+ent_darwin_arm64.zip"
    sha256 "5cba1f78a4596ea5cc10278b9ac755cdbfbf14df1db4abe78f9f08e9f5a31caa"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/2.1.0+ent/vault_2.1.0+ent_linux_amd64.zip"
    sha256 "0a9a0e4e445d789ff6f9f6cf83fa3c5de1f42ea4bd823e64980862d733370df3"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/2.1.0+ent/vault_2.1.0+ent_linux_arm64.zip"
    sha256 "a0fbfb3fb07e5c4574f07062338f8fb10b4464c0622e3cc9b3b030d3c9afc2da"
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
