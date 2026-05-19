# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "2.0.1+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/2.0.1+ent/vault_2.0.1+ent_darwin_amd64.zip"
    sha256 "a40c2f37f999d2395ffbecb85084f79c862e6705f44f009d665b26a620f64bc1"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/2.0.1+ent/vault_2.0.1+ent_darwin_arm64.zip"
    sha256 "289d26c7b7580a6f3144a12f05ccf38e00695b4e1168042a52888be012b82b05"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/2.0.1+ent/vault_2.0.1+ent_linux_amd64.zip"
    sha256 "a0be85da78a57570bba5811151a8cf34d4f3fb4ad0bfc67454af15f64c5c1ece"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/2.0.1+ent/vault_2.0.1+ent_linux_arm64.zip"
    sha256 "7312648bd46c41ba95889522f22de543450113a73e4ab57266322564c51db4a5"
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
