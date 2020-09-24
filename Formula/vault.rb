class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"

  url "https://releases.hashicorp.com/vault/1.5.4/vault_1.5.4_darwin_amd64.zip"
  version "1.5.4"
  sha256 "15effe53a7f4a6b7b61192d3540df5b4b5ca7ea95a4dae4767d550de26aaa515"
  bottle :unneeded

  conflicts_with "vault"

  def install
    bin.install "vault"
  end

  test do
    system "#{bin}/vault --version"
  end
end
