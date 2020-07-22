class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.4.3"
  bottle :unneeded


  url "https://releases.hashicorp.com/vault/1.4.3/vault_1.4.3_darwin_amd64.zip"
  sha256 "2198a1e7b5a006434f6acb22ec39d45d17315477a86e2f9d85e2f6f5e845483c"

  conflicts_with "vault"

  def install
    bin.install "vault"
  end

  test do
    system "#{bin}/vault --version"
  end
end
