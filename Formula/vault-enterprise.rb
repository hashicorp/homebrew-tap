# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.17.3+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.17.3+ent/vault_1.17.3+ent_darwin_amd64.zip"
    sha256 "bdd1b20652468f0e65d22401afdd72ed570f1dd6da550db3354ba28f766f0001"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.17.3+ent/vault_1.17.3+ent_darwin_arm64.zip"
    sha256 "9f2540ccfeb6422278a8343cba4b6c02a81c4e289371ebacfcc1ad9d88a6bc8a"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.17.3+ent/vault_1.17.3+ent_linux_amd64.zip"
    sha256 "d535d412ae8c1537fa5861d8966b8172bd681a3d49f13f20047271e3e13e2615"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.17.3+ent/vault_1.17.3+ent_linux_arm.zip"
    sha256 "dcf080b1c705293d32d4385c9763a4a154c7e5a6082b9555d8e63916d59283fe"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.17.3+ent/vault_1.17.3+ent_linux_arm64.zip"
    sha256 "5c7009ee3364d2d63e74dcbb7e711440ecd688c2ea6c68a7825af9e2c3247a57"
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
