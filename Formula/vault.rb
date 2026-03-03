# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.21.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.21.1/vault_1.21.1_darwin_amd64.zip"
    sha256 "d33bb27a0ad194e79c2bed9cad198a1f1319d8ca68bc6c4e6f68212c734cda09"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.21.1/vault_1.21.1_darwin_arm64.zip"
    sha256 "add728e2ca2101826de030b4da6de77cee5a61f3c9cde74f5628d63332bea0ab"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.21.1/vault_1.21.1_linux_amd64.zip"
    sha256 "4088617653eba4ea341b6166130239fcbe42edc7839c7f7c6209d280948769c7"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.21.1/vault_1.21.1_linux_arm.zip"
    sha256 "56641846b7713fdcae77aa0b34fbd3fb67ab0aaa4e2df2d9e55ddf4c06cd8576"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.21.1/vault_1.21.1_linux_arm64.zip"
    sha256 "f83f541e4293289bf1cc3f1e62e41a29a9ce20aeb9a152ada2b00ca42e7e856d"
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
