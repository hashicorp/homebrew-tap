# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.17.2+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.17.2+ent/vault_1.17.2+ent_darwin_amd64.zip"
    sha256 "875dea0952a2fd695bf5a1153091c2c2961ded685ea5b17738c5901c3ff81bb6"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.17.2+ent/vault_1.17.2+ent_darwin_arm64.zip"
    sha256 "f4b876b490e2c70c7ecdfd5b453828a3a62847101352cf8583ae06ef20cbd7b9"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.17.2+ent/vault_1.17.2+ent_linux_amd64.zip"
    sha256 "f1d34095f5f8ee2e577b64a9cff07c49b3c4bd3c3b06b3e90e0efa8ec1d3c823"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.17.2+ent/vault_1.17.2+ent_linux_arm.zip"
    sha256 "0c49e077e88556425d292a146ee6b28156bbc711240268adea9ff252b16fceeb"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.17.2+ent/vault_1.17.2+ent_linux_arm64.zip"
    sha256 "46fc7bfc383f1f77f000bc0ea10b78916de7c0f2399e2f3dc533962ca92be287"
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
