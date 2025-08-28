# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.20.3+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.20.3+ent/vault_1.20.3+ent_darwin_amd64.zip"
    sha256 "21a60c7f71e3cf48efddae22a8a892dc6f358522f2929f17489e9846eddd7f44"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.20.3+ent/vault_1.20.3+ent_darwin_arm64.zip"
    sha256 "c699bee5c15f00e0ebf3c6f56ae13355286486b3985503df7344c4e33bad239a"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.20.3+ent/vault_1.20.3+ent_linux_amd64.zip"
    sha256 "0a323b4ea7dd9264be7ae30f16748bdbd3029acb8a07ba2d9d5a57b92f9f4cdf"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.20.3+ent/vault_1.20.3+ent_linux_arm.zip"
    sha256 "949db8ef36ad91eba1fed4fcbb88a8823ed5992a2073a4ee9ddf99bb1e8c4e0f"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.20.3+ent/vault_1.20.3+ent_linux_arm64.zip"
    sha256 "4fa56c0ecaa8bcfb2483ea6253de57f91d7593ff6abd7e05f4fd5c82ccd0f0dc"
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
