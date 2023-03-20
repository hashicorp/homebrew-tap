class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.13.0+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.13.0+ent/vault_1.13.0+ent_darwin_amd64.zip"
    sha256 "ebe1a25bfcf5068d462815d2e2728b5371b8e90ef9ce750d6e2efb6b52dab79e"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.13.0+ent/vault_1.13.0+ent_darwin_arm64.zip"
    sha256 "1ea2a8dca40167a4bfa64cb6439cb76d290dbe346e95bf1f124938f1a7a84c86"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.13.0+ent/vault_1.13.0+ent_linux_amd64.zip"
    sha256 "d4888ce1695c11a7671485f4128bb5a30ec04ab5bf53cfa8bfe3b2c3e75b92db"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.13.0+ent/vault_1.13.0+ent_linux_arm.zip"
    sha256 "6d9b5f68e556a9eb0ce807ea2a7facd661c02451f720544bbea72e8921e74e35"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.13.0+ent/vault_1.13.0+ent_linux_arm64.zip"
    sha256 "8eb42656e661c778bfdd8badebf9bf4a8998855e3c6ff998be2a7bd67fc5aaff"
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
