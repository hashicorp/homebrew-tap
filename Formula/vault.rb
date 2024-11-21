# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.18.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.18.2/vault_1.18.2_darwin_amd64.zip"
    sha256 "b39fa96253182085b1595db9c39498da9776f7bd057dae75509d73b935a127b2"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.18.2/vault_1.18.2_darwin_arm64.zip"
    sha256 "abd715b65cdf817cc8b33f38f37a26875d5b46321e07b6444616e2c5d6266630"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.18.2/vault_1.18.2_linux_amd64.zip"
    sha256 "a448c8b6839d76ec54fa320d3a558ff0e5ef0c3d27ea78c88ace333461d7264b"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.18.2/vault_1.18.2_linux_arm.zip"
    sha256 "bbd96c39dcb4a0766b5fcc0263925b6f4c158c0a93536d9ad5472e94f89a341d"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.18.2/vault_1.18.2_linux_arm64.zip"
    sha256 "b3c38a2f85777d3c56efd16d985019c0b758f6003e9b2ad670ab1ef0d0580285"
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
