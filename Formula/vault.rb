# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.20.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.20.2/vault_1.20.2_darwin_amd64.zip"
    sha256 "af9b5fecf07309ad1ac809a9174aa6e9d86fcf3854088e33ef4d3150eda0d47b"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.20.2/vault_1.20.2_darwin_arm64.zip"
    sha256 "0564747cdc4db1343e17e96ec05c4b69be565052c1ed5377c33ae6eaf919ef62"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.20.2/vault_1.20.2_linux_amd64.zip"
    sha256 "5846abf08deaf04cc9fdbb7c1eddda3348671590445f81bcdb0a2e0d32396c2e"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.20.2/vault_1.20.2_linux_arm.zip"
    sha256 "1280bd7454a545ac284e03bc9a6e5f34f4093d40b0cbe6ce4293ac204030b745"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.20.2/vault_1.20.2_linux_arm64.zip"
    sha256 "97543eb24f3fde2b8a2cdc79d6017fc39d3d91f42b5e856e5808f30de51cf3a3"
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
