class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"

  url "https://releases.hashicorp.com/vault/1.5.3/vault_1.5.3_darwin_amd64.zip"
  version "1.5.3"
  sha256 "ca2fa78f05c268d1310d25b3bc3ad20b2970e15c564924c54d2737475111a4d4"
  bottle :unneeded

  conflicts_with "vault"

  def install
    bin.install "vault"
  end

  test do
    system "#{bin}/vault --version"
  end
end
