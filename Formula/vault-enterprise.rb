# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.13.1+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.13.1+ent/vault_1.13.1+ent_darwin_amd64.zip"
    sha256 "6317188157552b77cf25b7ba9f78803db36301affb225077a0f7a999fba81aa5"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.13.1+ent/vault_1.13.1+ent_darwin_arm64.zip"
    sha256 "a056c5a3c44e76a4b0352159f1eb282114c88a82e888bb55f72546788bb0db67"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.13.1+ent/vault_1.13.1+ent_linux_amd64.zip"
    sha256 "3a70bccfe0bfddae9e9b26ae75a31562de74d2626344f46182629961d6db6c62"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.13.1+ent/vault_1.13.1+ent_linux_arm.zip"
    sha256 "53eed816a386d0bb3101a66f5445d35fad0981a7e86e7f0cc9345ede41469d40"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.13.1+ent/vault_1.13.1+ent_linux_arm64.zip"
    sha256 "70be97d4dacfbaf1af765d6c54841adf06677f6f2ac660d6e40bea759ced1bfa"
  end

  conflicts_with "vault-enterprise"

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
