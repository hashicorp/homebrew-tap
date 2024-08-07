# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.17.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.17.3/vault_1.17.3_darwin_amd64.zip"
    sha256 "fd7e7c7a467723639cc0b624533a9f7aff0691bfbfe47602abac75af0be4914a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.17.3/vault_1.17.3_darwin_arm64.zip"
    sha256 "26f11328a9c9e3b5599ec63efe394aed5fed0879c662f9ca320b8ec63d839582"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.17.3/vault_1.17.3_linux_amd64.zip"
    sha256 "146536fd9ef8aa1465894e718a8fe7a9ca13d68761bae900428f01f7ecd83806"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.17.3/vault_1.17.3_linux_arm.zip"
    sha256 "246ddb7e194ca428b93e0a0484abd258c01b1db712546120455741a22162a1b6"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.17.3/vault_1.17.3_linux_arm64.zip"
    sha256 "6c7dc39df0058b1fa9e65050227cdb12dc7913153ecd56956911fb973c353590"
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
