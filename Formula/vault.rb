# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.13.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.13.3/vault_1.13.3_darwin_amd64.zip"
    sha256 "cb8f749a4f93e1c63baa4803dd5c039dc25a2c4f24efd3d29f7be901f6463de1"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.13.3/vault_1.13.3_darwin_arm64.zip"
    sha256 "ac1635022dc1145b9a8ade9160e9c2cb0f8b57800c3273fc4b28e852531b7571"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.13.3/vault_1.13.3_linux_amd64.zip"
    sha256 "7ca502f1c50dd043862276705b4ccc1fa45f633345ca7d01fc5b4ba1d820c51e"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.13.3/vault_1.13.3_linux_arm.zip"
    sha256 "a215e12136c25d18dd0320d560d752f4722f3d049dc65821097b8b6521fbf3d8"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.13.3/vault_1.13.3_linux_arm64.zip"
    sha256 "8e2cf7f013cd755fcb10e8e4f2e9dc2866a8eafab76a4bd6b5ae9210e5f61f9e"
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
