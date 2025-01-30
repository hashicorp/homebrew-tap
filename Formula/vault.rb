# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.18.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.18.4/vault_1.18.4_darwin_amd64.zip"
    sha256 "ead7d631454b0c8e895ddce770558d6a40e2b6423616150a0ac53cf9c4bf1ef8"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.18.4/vault_1.18.4_darwin_arm64.zip"
    sha256 "e0098a3dda3712b8f1ba14930fe9fa4edc8c68a8c01b46565797ea5198b60b6e"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.18.4/vault_1.18.4_linux_amd64.zip"
    sha256 "bdde42660c14700e4d5275760d50c59ed637803cd9c7c12926a2e2e788097a45"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.18.4/vault_1.18.4_linux_arm.zip"
    sha256 "f16b5daae8af05160529fac3223b370f7e19b0c112554ad8be283ff2c416659e"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.18.4/vault_1.18.4_linux_arm64.zip"
    sha256 "19ab068acb3b25c1d049405401b35b4083877190714bfbddeaadcbd4f26d23d2"
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
