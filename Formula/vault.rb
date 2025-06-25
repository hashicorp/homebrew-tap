# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.20.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.20.0/vault_1.20.0_darwin_amd64.zip"
    sha256 "eefb98743ff5530edb10088353e51c9a9b879d4004da8d17084421d706ead8e2"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.20.0/vault_1.20.0_darwin_arm64.zip"
    sha256 "69bd6ddba47dc6342a6cd211af7419e7f306d5e5d7551f26ffde3b40924cfe75"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.20.0/vault_1.20.0_linux_amd64.zip"
    sha256 "25e9f1f9a6dd9866219d6a37c6d1af1d26d0e73aa95a4e755188751de133dea7"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.20.0/vault_1.20.0_linux_arm.zip"
    sha256 "a115f04d9072ad7c18f932e3173d209073a84760d0e0d94e64d77f68c5f637ef"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.20.0/vault_1.20.0_linux_arm64.zip"
    sha256 "b7b87fef8d10126ad69e7130fb5fe4903dd0011506c61e7fec4502af0519c2fa"
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
