# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.19.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.19.1/vault_1.19.1_darwin_amd64.zip"
    sha256 "3cb0eddebbe82622a20f5256890d71fcc1a4b0ff56561f9d68b29bb0e8b99ab6"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.19.1/vault_1.19.1_darwin_arm64.zip"
    sha256 "392df64ce576fcc61508755b842160058e79fe438b30ac4b7fb64dd71f2ca781"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.19.1/vault_1.19.1_linux_amd64.zip"
    sha256 "a673933f5b02236b5e241e153c0d2fed15b47b48ad640ae886f8b3b567087a05"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.19.1/vault_1.19.1_linux_arm.zip"
    sha256 "b0b56cb005916112493d5fa91cd453dfe23d873cc9dc737a0ced257c27efbcda"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.19.1/vault_1.19.1_linux_arm64.zip"
    sha256 "27561edfbc3a59936c9a892d6a130ada5a224c91862523c1aa596bfd30cd45e3"
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
