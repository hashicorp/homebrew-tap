# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.18.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.18.0/vault_1.18.0_darwin_amd64.zip"
    sha256 "09d0389fd19e900891d3377a11d4e7f3ca8bb84791cebde2086f9cee892c7afb"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.18.0/vault_1.18.0_darwin_arm64.zip"
    sha256 "db645ded323cbfef23a7d762b88408c2483485f526891942b4988a5d224b0f48"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.18.0/vault_1.18.0_linux_amd64.zip"
    sha256 "a9d6b0891f8561db673b638c2d6bdbe9cbdabaecf5bcd8fe6ce09bb73f1fd7a2"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.18.0/vault_1.18.0_linux_arm.zip"
    sha256 "44d65ccb8d8ae36a46565cc611e14be7b1fc2ab5374bcc988a0bd575bd5c5b68"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.18.0/vault_1.18.0_linux_arm64.zip"
    sha256 "7bcb6eec3f7a3dd398687f1cf15897ec20b7eae6335f0c85453d591b3c05fb6e"
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
