# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.16.3+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.16.3+ent/vault_1.16.3+ent_darwin_amd64.zip"
    sha256 "342629a2577d4ad7e6c2fa12d0ecd74eb8bb2ad09f01582ae29f069dca7dcf66"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.16.3+ent/vault_1.16.3+ent_darwin_arm64.zip"
    sha256 "82cdbce7f2349bca9735ede3d1a845a58c3ec0f329557e4e1e38a89656ca0d7a"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.16.3+ent/vault_1.16.3+ent_linux_amd64.zip"
    sha256 "216ee8a74d42909fb6ce599ba2fb1dfcf323e807026e2796165d442677ef1a18"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.16.3+ent/vault_1.16.3+ent_linux_arm.zip"
    sha256 "3fbd140b8d478a4378891e737235a3299bb444ba8222b447e92c2c1c4c051e89"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.16.3+ent/vault_1.16.3+ent_linux_arm64.zip"
    sha256 "e523bb5b634ae401b6af27ee070eac01a0ed3df10b7029133d7953c2b89c50c6"
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
