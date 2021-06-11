class VaultEnt < Formula
  desc "VaultEnt"
  homepage "https://www.vaultproject.io"

  url "https://releases.hashicorp.com/vault/1.5.4+ent/vault_1.5.4+ent_darwin_amd64.zip"
  version "1.5.4+ent"
  sha256 "75b756fe0381d5733a7bf69f90b480af2ea83e9383a1bda3c536f3bc72628933"
  bottle :unneeded

  conflicts_with "vault"

  def install
    bin.install "vault"
  end

  test do
    system "#{bin}/vault --version"
  end
end
