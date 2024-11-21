# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.18.2+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.18.2+ent/vault_1.18.2+ent_darwin_amd64.zip"
    sha256 "7f0fefe83aeb95b73e0460728253ff723c6fcf72116da3617c22df94a37d036b"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.18.2+ent/vault_1.18.2+ent_darwin_arm64.zip"
    sha256 "ff0e3a325df9ab5ca5dedc78d929abfebe0c18aa736875fc69a86769223a66ac"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.18.2+ent/vault_1.18.2+ent_linux_amd64.zip"
    sha256 "bf36767e7104a890bfadd694b23b07e18d92100a2625692e378ba37c30398502"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.18.2+ent/vault_1.18.2+ent_linux_arm.zip"
    sha256 "9ac5530b1372cb9c3f1ae926f055dd94ae3515ee3cf1c7dba08a9480eaacacb0"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.18.2+ent/vault_1.18.2+ent_linux_arm64.zip"
    sha256 "0166606a94592edea80019a60c94c6162345f126aef1dadadee4745359e7fbdc"
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
