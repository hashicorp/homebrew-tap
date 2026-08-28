# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "2.0.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/2.0.4/vault_2.0.4_darwin_amd64.zip"
    sha256 "79d29add23b2ca4144927b5d3d062ccd6f9345c5cdbf5b3624652ea9a5100261"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/2.0.4/vault_2.0.4_darwin_arm64.zip"
    sha256 "73b36e75eedcf949262707d9169a793a3901a0990306329163f3ac94df31d5fa"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/2.0.4/vault_2.0.4_linux_amd64.zip"
    sha256 "7429e7d85f8ef29df063701c49420f7984a0ae2c8511c026cc75edfbbb2df387"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/2.0.4/vault_2.0.4_linux_arm64.zip"
    sha256 "87bb68fdd04ca90cd4cf54f8cd783a037fbf860b73d85e6697f6129dac49c683"
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
