class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.4.3"
  bottle :unneeded

  if OS.mac?
    url "https://releases.hashicorp.com/vault/1.4.3/vault_1.4.3_darwin_amd64.zip"
    sha256 "30d08188fd251a4e214c3a320472ee0b27b0499522860b7061bf0e49bc5fc466"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://releases.hashicorp.com/vault/1.4.3/vault_1.4.3_linux_amd64.zip"
      sha256 "f486da4f6d08e42eb2c17e95cf36cc7f9d9c0e7cc8ced06ce3fca7c3abd7db3d"
    end
  end

  conflicts_with "vault"

  def install
    bin.install "vault"
  end

  test do
    system "#{bin}/vault --version"
  end
end
