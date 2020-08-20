class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"

  url "https://releases.hashicorp.com/vault/1.5.1/vault_1.5.1_darwin_amd64.zip"
  version "1.5.1"
  sha256 "128d11b9fb2de40349fe534ca253d4ad87f2a646cac9dfd63b232e20ce62b54b"
  bottle :unneeded

  conflicts_with "vault"

  def install
    bin.install "vault"
  end

  test do
    system "#{bin}/vault --version"
  end
end
