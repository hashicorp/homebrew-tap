# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.13.2+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.13.2+ent/vault_1.13.2+ent_darwin_amd64.zip"
    sha256 "71de1d0af36cbd2520ee5351978baee734eb303354f7a850268cb66bd5b4bd74"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.13.2+ent/vault_1.13.2+ent_darwin_arm64.zip"
    sha256 "b35b39879ed4d12ce9b85fccfd039a7da8631399e555e01108c0858c87682892"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.13.2+ent/vault_1.13.2+ent_linux_amd64.zip"
    sha256 "e9239da75f9f90570c20344d7b29900b1edd6eab416b38a2f6220a6f857cd662"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.13.2+ent/vault_1.13.2+ent_linux_arm.zip"
    sha256 "e3be47208462462cd8a371c38eab7d35e473be00bd2cdf7b232f79229f8c4547"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.13.2+ent/vault_1.13.2+ent_linux_arm64.zip"
    sha256 "aed9f4893f97af40694aa5e9443c2e84aa4a047a84c4aa825663e27234176dd2"
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
