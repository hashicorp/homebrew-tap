# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.14.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.14.1/vault_1.14.1_darwin_amd64.zip"
    sha256 "35422e5276957bcac4011fd16e39a99b068d746aae7ffb59448a3fc0dbf73b08"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.14.1/vault_1.14.1_darwin_arm64.zip"
    sha256 "61201113883672a914282ca34cac659c5eba650aaa5e6cedbbc44fd5d0e31a45"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.14.1/vault_1.14.1_linux_amd64.zip"
    sha256 "6031432dfc3de07f6523d206c44fc018aa969d94c8e9125a77340af359f57ea3"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.14.1/vault_1.14.1_linux_arm.zip"
    sha256 "b730d3e887a62bb9493d203f6c21b2732d4da8e81fb11ac2761a7452609d0950"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.14.1/vault_1.14.1_linux_arm64.zip"
    sha256 "1ab6252b04cde5d238fbd37f16c2be4585169886002ab50198fe0d9a2bf270fe"
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
