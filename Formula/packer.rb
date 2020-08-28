class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"

  url "https://releases.hashicorp.com/packer/1.6.2/packer_1.6.2_darwin_amd64.zip"
  version "1.6.2"
  sha256 "2b5e8c76ae280c72fe33b2ac6511c24d2e0c02df9d437d2e4a5efbe988f71e2b"
  bottle :unneeded

  conflicts_with "packer"

  def install
    bin.install "packer"
  end

  test do
    system "#{bin}/packer --version"
  end
end
