# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.16.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.16.3/vault_1.16.3_darwin_amd64.zip"
    sha256 "faaaddb862661c7e22eb47f51f833d3cc355561c68c633009f089b01c76ae3c9"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.16.3/vault_1.16.3_darwin_arm64.zip"
    sha256 "5e412e2541f899182656c8a87575558ccb03acc95fad0470202bf965731836a1"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.16.3/vault_1.16.3_linux_amd64.zip"
    sha256 "ca33d4adc55cc3ac37249198254f2a85fee5fb878b37bcf5e1f5535de82161d8"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.16.3/vault_1.16.3_linux_arm.zip"
    sha256 "ebd47af082ad8d8c8990bcbe6c46397850b221abdcf4ed5ae4b61979374698e5"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.16.3/vault_1.16.3_linux_arm64.zip"
    sha256 "d03a4b998d61c1434bc46e332b8b85bbad4d12bbfdbbb11ecff6561b0e2ff049"
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
