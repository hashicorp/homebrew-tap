# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.16.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.16.2/vault_1.16.2_darwin_amd64.zip"
    sha256 "e4886d22273dedc579dc2382e114e7be29341049a48592f8f7be8a0020310731"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.16.2/vault_1.16.2_darwin_arm64.zip"
    sha256 "ca59c85e7e3d67e25b6bfa505f7e7717b418452e8bfcd602a2a717bc06d5b1ee"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.16.2/vault_1.16.2_linux_amd64.zip"
    sha256 "688ce462b70cb674f84fddb731f75bb710db5ad9e4e5a17659e90e1283a8b4b7"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.16.2/vault_1.16.2_linux_arm.zip"
    sha256 "34cc795446bcdd5a6e4bbb7fd15cac0fda5a473b5456ec2053b485038d920442"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.16.2/vault_1.16.2_linux_arm64.zip"
    sha256 "d5bd42227d295b1dcc4a5889c37e6a8ca945ece4795819718eaf54db87aa6d4f"
  end

  conflicts_with "vault"

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
