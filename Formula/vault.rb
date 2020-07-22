class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.5.0"
  bottle :unneeded


  url "https://releases.hashicorp.com/vault/1.5.0/vault_1.5.0_darwin_amd64.zip"
  sha256 "12f76f032d6192cc16ea79205c09c7a97635228d92f34568c5938ce1e1514877"

  conflicts_with "vault"

  def install
    bin.install "vault"
  end

  test do
    system "#{bin}/vault --version"
  end
end
