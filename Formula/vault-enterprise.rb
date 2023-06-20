# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.13.4+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.13.4+ent/vault_1.13.4+ent_darwin_amd64.zip"
    sha256 "0bc3079df1cc0ca292211f1b4266fd5238cf2ab6ca6e0e5dde04db860c6f7c54"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.13.4+ent/vault_1.13.4+ent_darwin_arm64.zip"
    sha256 "73eb488710632cbf95ecfbe5c902e13ea223f79e316b92d6bc3f70df3ca4c87e"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.13.4+ent/vault_1.13.4+ent_linux_amd64.zip"
    sha256 "edfabf9a49e628be6058f597a3e48133ec205b9e660c1c2a7e0df03fb93d3ab8"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.13.4+ent/vault_1.13.4+ent_linux_arm.zip"
    sha256 "42962c7d9fb9b8895202eb6fa95d1fc71c4445b90f196a8f44a49cf953adbfeb"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.13.4+ent/vault_1.13.4+ent_linux_arm64.zip"
    sha256 "c496220acb5401395385b650ffa962346c043f4de12b7ec8ddb24b89c9f57a17"
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
