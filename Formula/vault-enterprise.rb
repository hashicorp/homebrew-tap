# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.18.1+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.18.1+ent/vault_1.18.1+ent_darwin_amd64.zip"
    sha256 "1a775f892fef330f4a593e29df86bc4409f6120122137408312adea346daa0a3"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.18.1+ent/vault_1.18.1+ent_darwin_arm64.zip"
    sha256 "40788a62d34f0f0d8ab086ba73cd1da71443a6cb73ef974c5bf725ae81a06821"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.18.1+ent/vault_1.18.1+ent_linux_amd64.zip"
    sha256 "b762299bf29afb609fa094b977b1dff3f03d77d45140772ea060a48d5a92aa3c"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.18.1+ent/vault_1.18.1+ent_linux_arm.zip"
    sha256 "553cb454fadd7a1184303baa854975d172f430d66d2e42663f75b23d2f2ce287"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.18.1+ent/vault_1.18.1+ent_linux_arm64.zip"
    sha256 "c36dc6c61a8d989b39c5bc73178f2673b73fcad09e548b09fd01b23da71cec28"
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
