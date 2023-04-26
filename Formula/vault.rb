# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.13.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.13.2/vault_1.13.2_darwin_amd64.zip"
    sha256 "5b9f1da25ba26b90d98bb0f04a1ff930d09389d7b769d295dd2666dbb616fcd3"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.13.2/vault_1.13.2_darwin_arm64.zip"
    sha256 "c8b8a395f3f6cfa07023619c22b3d1809827772bf61b692039e89eb5447eb406"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.13.2/vault_1.13.2_linux_amd64.zip"
    sha256 "f7930279de8381de7c532164b4a4408895d9606c0d24e2e9d2f9acb5dfe99b3c"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.13.2/vault_1.13.2_linux_arm.zip"
    sha256 "e6120caa7c3fcce6be6c43f9ca24cbbb75960e9128070f8a6ddf23b6b8747088"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.13.2/vault_1.13.2_linux_arm64.zip"
    sha256 "5f72b0cbfd857a4f70ae06978260d56b50b36b478a3b68a158dc49d854de290d"
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
