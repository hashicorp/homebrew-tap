# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.18.5"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.18.5/vault_1.18.5_darwin_amd64.zip"
    sha256 "98609db17c1e37036b2cd04e10f707c15c4b4fe8b2865e9be4bc3b0a0d8f5058"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.18.5/vault_1.18.5_darwin_arm64.zip"
    sha256 "c9c713fcc93273289a9d82468571e26aa657fa49ca5274132c682b8ae4b1b041"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.18.5/vault_1.18.5_linux_amd64.zip"
    sha256 "dfd8619affbc6449a2f8b23a04f1e8632a00e9b8010b49f7f5daf253d181129d"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.18.5/vault_1.18.5_linux_arm.zip"
    sha256 "b6561c045e157fa8e49d9cc995ec9c7e1c298cd43a05c7872153f054b8abb4fc"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.18.5/vault_1.18.5_linux_arm64.zip"
    sha256 "5048f3b08126b2578b2a919e2ee7e5afbbd070ef5bb3ecf92c9e06227675310c"
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
