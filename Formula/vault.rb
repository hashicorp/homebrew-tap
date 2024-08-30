# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.17.5"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.17.5/vault_1.17.5_darwin_amd64.zip"
    sha256 "72afe41e47711036a8ed521ae4408853d207c8f8f9f038484abffe05c8737005"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.17.5/vault_1.17.5_darwin_arm64.zip"
    sha256 "a89d565f66b5ba3b5966ab23a754ef4e026644c9bb48dadd02a2d9714475ac86"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.17.5/vault_1.17.5_linux_amd64.zip"
    sha256 "67eb9f95d37975e2525bbd455e19528a7759f3a56022de064bf8605fc220be47"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.17.5/vault_1.17.5_linux_arm.zip"
    sha256 "8a16886e69eed6f09eaa2a3ed84f72ba1076886e5c9abcd4cf7947c58c847929"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.17.5/vault_1.17.5_linux_arm64.zip"
    sha256 "abafcc3cac1570abbe7bf9a2072c18bc48c9ef7e3470766562f622e6b1e0aef1"
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
