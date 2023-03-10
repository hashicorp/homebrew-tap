class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.13.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.13.0/vault_1.13.0_darwin_amd64.zip"
    sha256 "0e257aea33dd7e0c0cb92f5299c32d63524ebbe16d9b51dae980e03d99726029"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.13.0/vault_1.13.0_darwin_arm64.zip"
    sha256 "3d3499e3717646a6a8d50ce52c734edc60915f3a768eb74bcaa51bf945c66bc2"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.13.0/vault_1.13.0_linux_amd64.zip"
    sha256 "69c1ce6dd383bb342c4f861a51a91413eb05e1324159e4395532e42a8a59af9d"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.13.0/vault_1.13.0_linux_arm.zip"
    sha256 "7a63fd0e7e5d7edf7c68d4d0fac9f3aa6cab7a304fc4eb0390fa935a7fb3f898"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.13.0/vault_1.13.0_linux_arm64.zip"
    sha256 "3234f989678d510f54e0ca20c93e045a9b1a86e337b09f2962e573b81c9a9ebf"
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
