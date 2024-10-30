# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.18.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.18.1/vault_1.18.1_darwin_amd64.zip"
    sha256 "8767a3d63d432a8810efcb830c4ad713c72a396d1aff64fd5d7ebeeccf6f141c"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.18.1/vault_1.18.1_darwin_arm64.zip"
    sha256 "ec8fc86f13ea153e2e2161e0d8bc30edea99e8e177aaa39b46c7f5a4f48b20ab"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.18.1/vault_1.18.1_linux_amd64.zip"
    sha256 "d6486e4644cbeefa841ff6a41e39b68a5129c329bd2e271b29368948ff9ddfc4"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.18.1/vault_1.18.1_linux_arm.zip"
    sha256 "52fd43d1a1fc7626f82b111d061366dec7f9551eaae4f1bbf0f39448aa238d84"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.18.1/vault_1.18.1_linux_arm64.zip"
    sha256 "c62ff127b9b1b6e984c0c3c88ee68d9348f8f3d5e9bbc1a639c09607827ebb0e"
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
