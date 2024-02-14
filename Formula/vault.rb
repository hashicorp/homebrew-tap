# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.17.1"

  if OS.mac? && Hardware::CPU.intel?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/vault/1.17.1/vault_1.17.1_darwin_amd64.zip"
    sha256 "043dfdf4fa51f2b8d7682dce00f6361a66b1d9d7e0e13c56f07328c8a901d22c"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/vault/1.17.1/vault_1.17.1_darwin_arm64.zip"
    sha256 "782eff3fddaf1a12a6467f899a81c1423a752c4c7d5f512232cbc3811fa07c54"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/vault/1.17.1/vault_1.17.1_linux_amd64.zip"
    sha256 "f2266dcecabff8809a54f7cf3688c1946408e8f863bcf379ef9146ab3a1c3f4a"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/vault/1.17.1/vault_1.17.1_linux_arm.zip"
    sha256 "c68cf3e54c964e6e7659c64a533a4d5d2702b4ed800ae941186c1c9f8a70323b"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/vault/1.17.1/vault_1.17.1_linux_arm64.zip"
    sha256 "6f6449cb8d353af99c8506f92b9b53111def3daba32c72f2483a8ae98faff2f2"
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
