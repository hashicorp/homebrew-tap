# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.15.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.15.1/vault_1.15.1_darwin_amd64.zip"
    sha256 "13754da3430d3d9fa8f32588a43689e4b0f6d703420df2d65b800c64531785e1"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.15.1/vault_1.15.1_darwin_arm64.zip"
    sha256 "47e933f4d240341fbc4d6117925b933e344d85df579e004d7339aeff315bf4d9"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.15.1/vault_1.15.1_linux_amd64.zip"
    sha256 "c23cc68ce9c9be95782d70ff9db634a20e56e4ee16accc74d3d87e67eac5611e"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.15.1/vault_1.15.1_linux_arm.zip"
    sha256 "0b1981d36671bd95c468b18cc9b1ec91a53ea0e983b3ac8d854c3427f7ba91c1"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.15.1/vault_1.15.1_linux_arm64.zip"
    sha256 "905787bfa4e13b12447f35d9efc88b07388f152347658890261de682db4237d1"
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
