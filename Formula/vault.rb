# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.21.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.21.4/vault_1.21.4_darwin_amd64.zip"
    sha256 "a667be3cf56dd0f21a23ba26b47028d1f51b3ca61e71b0e29ceafef1c2a1dc3a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.21.4/vault_1.21.4_darwin_arm64.zip"
    sha256 "c79012c1c8aedd682c68b5d9c89149030611c82da57f45383aef004b39a640d2"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.21.4/vault_1.21.4_linux_amd64.zip"
    sha256 "889b681990fe221b884b7932fa9c9dd0ee9811b9349554f1aa287ab63c9f3dae"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.21.1/vault_1.21.1_linux_arm.zip"
    sha256 "56641846b7713fdcae77aa0b34fbd3fb67ab0aaa4e2df2d9e55ddf4c06cd8576"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.21.4/vault_1.21.4_linux_arm64.zip"
    sha256 "1104ef701aad16e104e2e7b4d2a02a6ec993237559343f3097ac63a00b42e85d"
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
