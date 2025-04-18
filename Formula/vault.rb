# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.19.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.19.2/vault_1.19.2_darwin_amd64.zip"
    sha256 "9a3316e9b15a9d9506fbc49c2cb982245c1c020f4ec7645199a89fe2e29c7f2d"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.19.2/vault_1.19.2_darwin_arm64.zip"
    sha256 "9de798bd94f3a7f56e068ba6d60bd51556c61ce6cdba53f2a90b1ff8934cfe3a"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.19.2/vault_1.19.2_linux_amd64.zip"
    sha256 "c6781c3e0ec431f39bcc8f1443d09f3b8944c90c348e91aa13182b4e1fd2797f"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.19.2/vault_1.19.2_linux_arm.zip"
    sha256 "42dc71105c45670c299130ca53547062961d8221f7179cf65ffb33825a32048a"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.19.2/vault_1.19.2_linux_arm64.zip"
    sha256 "73655835f07c407087fa951be617b3214c3e52e6bda7537290c8268c8a75b1a5"
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
