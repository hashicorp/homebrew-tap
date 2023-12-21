# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  release_repository = +ENV["HOMEBREW_HASHICORP_ARTIFACT_REPOSITORY_HOST"] || "https://releases.hashicorp.com"

  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.15.4+ent"

  if OS.mac? && Hardware::CPU.intel?
    url release_repository << "/vault/1.15.4+ent/vault_1.15.4+ent_darwin_amd64.zip"
    sha256 "ee66b311b7d668c14562a75d05eff395fff04dbe9e51549b85ae771fea8c365f"
  end

  if OS.mac? && Hardware::CPU.arm?
    url release_repository << "/vault/1.15.4+ent/vault_1.15.4+ent_darwin_arm64.zip"
    sha256 "8b55027902ef0df364c6ef42dbf0c04319e8faee00d53339233b80137f01ef26"
  end

  if OS.linux? && Hardware::CPU.intel?
    url release_repository << "/vault/1.15.4+ent/vault_1.15.4+ent_linux_amd64.zip"
    sha256 "4d7711df9a8d280c67f6c30ff45f26c9fd75458649b8a46ffe0ae73304ce32bb"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url release_repository << "/vault/1.15.4+ent/vault_1.15.4+ent_linux_arm.zip"
    sha256 "f07546676a6cbd85e166ef748e201c2f6d8f6bcd91441cfd146fa1840182baae"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url release_repository << "/vault/1.15.4+ent/vault_1.15.4+ent_linux_arm64.zip"
    sha256 "8d2f11d57b1d52d4e9264934e019c5ec542fe4fcbbc579e2b32911ff93de5cd3"
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
