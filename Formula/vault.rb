# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.17.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.17.4/vault_1.17.4_darwin_amd64.zip"
    sha256 "216fcc775d846c7ef323c0050c44f7712649fe19b4682f89c583779970a2b152"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.17.4/vault_1.17.4_darwin_arm64.zip"
    sha256 "9cdf0918cd5519b2f323f5c3a272d91d9afed6d671b1ab5da6a36d5590d52d26"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.17.4/vault_1.17.4_linux_amd64.zip"
    sha256 "b652291658b5d19e228e42950f39c757306945198fa8cbb28ee621893219924c"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.17.4/vault_1.17.4_linux_arm.zip"
    sha256 "b2e1af686d0b59297b32c9bd7d40c1a90e976f9543c7de7069eedb3520b1484f"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.17.4/vault_1.17.4_linux_arm64.zip"
    sha256 "d31f38a1daf33f67ec1c4a2d6bafe0793f1ede939ca0552dfc70f740cc57abb3"
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
