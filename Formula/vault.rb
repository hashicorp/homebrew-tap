# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "2.1.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/2.1.0/vault_2.1.0_darwin_amd64.zip"
    sha256 "4ec95a88b3ab2a4f367da41ab98946204d5d85b36b26b71c6685db997dfde36e"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/2.1.0/vault_2.1.0_darwin_arm64.zip"
    sha256 "c6589dc658f72ebd2792b1fba7b2e53413367ad673ae2513cfdec6422ed4da2c"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/2.1.0/vault_2.1.0_linux_amd64.zip"
    sha256 "08e8a13d29d20c5e28ef5e2c187bf3a2e84712a43615de1b3d24701ad9aab972"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/2.1.0/vault_2.1.0_linux_arm64.zip"
    sha256 "319b3eb7b0c2ad218453f5d1af5c23cac81a024db3a07ccd2494ecd31f2090c3"
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
