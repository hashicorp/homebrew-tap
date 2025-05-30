# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.19.5"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.19.5/vault_1.19.5_darwin_amd64.zip"
    sha256 "8ef26ccc896cc5c6e883f1d71734a1bcbc3199230f51f8d290675ee7b0f3f390"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.19.5/vault_1.19.5_darwin_arm64.zip"
    sha256 "217c5ff1dd4981c125055d5c16e915d7ef2a57d46b2dca75bc5923a786d99dc6"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.19.5/vault_1.19.5_linux_amd64.zip"
    sha256 "5192111920b3f745c10f8fea9988c46b91414a69bcf49df1f7c87880d80a3755"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.19.5/vault_1.19.5_linux_arm.zip"
    sha256 "4b19a8d8bcde2587750b39c4dcbb7f239526174f91455bf7c164530affe27525"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.19.5/vault_1.19.5_linux_arm64.zip"
    sha256 "182781907b589bec8efdd68d8b5dd44bd2ff3e64235eb781a394d2db874ad36a"
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
