# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.18.0+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.18.0+ent/vault_1.18.0+ent_darwin_amd64.zip"
    sha256 "a96f5fa8b6e8a040b29f46de6db92f50cdec2f1d78122105d51d08fe6dd325a3"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.18.0+ent/vault_1.18.0+ent_darwin_arm64.zip"
    sha256 "ffc8c94683ef4348ceea7ae7857c722875a3f04704a4c40ea8d7cc1494897918"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.18.0+ent/vault_1.18.0+ent_linux_amd64.zip"
    sha256 "cab9cc663b32572c5d87e0aad5fc5a76606c42151aa0149f87519944f0d40406"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.18.0+ent/vault_1.18.0+ent_linux_arm.zip"
    sha256 "a1e47aac1942a02069e7fdc4af9b3714d0987ca50f16a883b4905acf26d1f98b"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.18.0+ent/vault_1.18.0+ent_linux_arm64.zip"
    sha256 "947bf4309cd70af6f4a75a7dd22e2555fc9ee5fa7ef0fb84d4e862fd57067bf7"
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
