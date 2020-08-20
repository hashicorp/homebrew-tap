class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"

  url "https://releases.hashicorp.com/vault/1.5.2/vault_1.5.2_darwin_amd64.zip"
  version "1.5.2"
  sha256 "74608b89484d14f535a497042ae48340d108d8c423b964213856d264aac45d24"
  bottle :unneeded

  conflicts_with "vault"

  def install
    bin.install "vault"
  end

  test do
    system "#{bin}/vault --version"
  end
end
