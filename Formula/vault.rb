# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.19.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.19.3/vault_1.19.3_darwin_amd64.zip"
    sha256 "bc0f585510967ee6a87b0e587df8334ccb3d2c4d4734c3ac16624260f0283401"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.19.3/vault_1.19.3_darwin_arm64.zip"
    sha256 "beecf197ea3f40a1101185dd93dad30a6e0026823a072d48a7e5cdc73faeb2c0"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.19.3/vault_1.19.3_linux_amd64.zip"
    sha256 "94b1f5059ab7751d2305bd109289d7d6946c8c7e4c5227fd78ab67739fa43be2"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.19.3/vault_1.19.3_linux_arm.zip"
    sha256 "861ab8278dbcc0a25c0f03de308190ac8a29bbf05dc060add85db6d2fb7bb755"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.19.3/vault_1.19.3_linux_arm64.zip"
    sha256 "5f6d16c59166a1b0cc651238d7af2377da02028302b17174e561288eef4b6c80"
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
