# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.19.4+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.19.4+ent/vault_1.19.4+ent_darwin_amd64.zip"
    sha256 "6947898319bd5ff09b21886109c14a5c4ee9f24e8d64d26494fae355d812d627"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.19.4+ent/vault_1.19.4+ent_darwin_arm64.zip"
    sha256 "136d268d00c84f641188cb5ea17bea1268efb3cc8b9d7fc502a35704c94daca7"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.19.4+ent/vault_1.19.4+ent_linux_amd64.zip"
    sha256 "b40973b74ed5f224bc35249e1b6f720e862d4fe3d15e5fddee7603cde0e66584"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.19.4+ent/vault_1.19.4+ent_linux_arm.zip"
    sha256 "49364a71d11c732e2f2cf7e0bb0a924b9da878d8ea4f125a599b884e6b5c7051"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.19.4+ent/vault_1.19.4+ent_linux_arm64.zip"
    sha256 "fd758c35fe7153ef58b105f671f0cb137fafdfb17227d2179603d172a1400c15"
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
