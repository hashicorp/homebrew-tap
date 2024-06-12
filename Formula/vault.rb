# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.17.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.17.0/vault_1.17.0_darwin_amd64.zip"
    sha256 "3269d6f6586f2e8944183ebe1cbb5179a04b37c4c316148f2eff8f2904d66750"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.17.0/vault_1.17.0_darwin_arm64.zip"
    sha256 "2655b45fee57eaddd6303bc3bbdaf11f18fe126c5fc6ee7748a79c1ca0ad6fe4"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.17.0/vault_1.17.0_linux_amd64.zip"
    sha256 "79263a65e3f98b42ce9fe6a955231466435d84fbd56e3fea393418985156fe7d"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.17.0/vault_1.17.0_linux_arm.zip"
    sha256 "df97b5b13648a1162904550dafa8d36d1e31de96ca3abf5692d80c6b2c33f189"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.17.0/vault_1.17.0_linux_arm64.zip"
    sha256 "b2fbbe13e7737610e237ca86a4b16a933b4bf8da287f09b390537beec1fd416a"
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
