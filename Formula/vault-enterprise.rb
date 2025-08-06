# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.20.2+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.20.2+ent/vault_1.20.2+ent_darwin_amd64.zip"
    sha256 "289ced165d448d4cdabcc43f53b3fcc991dcf55febb78ce50d44d5c1f50e4a83"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.20.2+ent/vault_1.20.2+ent_darwin_arm64.zip"
    sha256 "3ff2b2cc27c52fb624c741847c3ea2e02eab342a96864357d5b3c79c3bc57baf"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.20.2+ent/vault_1.20.2+ent_linux_amd64.zip"
    sha256 "081e592c87d9209e0e77b8e7092ba71d9be64ba6eee0fafc935d9044d9c2afb3"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.20.2+ent/vault_1.20.2+ent_linux_arm.zip"
    sha256 "09f5bcf90bc12f3463455b730b606a3b14211107c970177aee5c3d74c85023f1"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.20.2+ent/vault_1.20.2+ent_linux_arm64.zip"
    sha256 "424efa0d75651de46d500bff710d2730582681fdb335e3d209d9443b936ccc0b"
  end

  conflicts_with "vault-enterprise"

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
