class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version: "1.4.2"
  bottle: unneeded

  if OS.mac?
    url "https://releases.hashicorp.com/vault/1.4.2/vault_1.4.2_darwin_amd64.zip"
    sha256 "30d08188fd251a4e214c3a320472ee0b27b0499522860b7061bf0e49bc5fc466"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://releases.hashicorp.com/vault/1.4.2/vault_1.4.2_linux_amd64.zip"
      sha256 "f2bca89cbffb8710265eb03bc9452cc316b03338c411ba8453ffe7419390b8f1"
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
