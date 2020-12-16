class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"

  url "https://releases.hashicorp.com/packer/1.6.6/packer_1.6.6_darwin_amd64.zip"
  version "1.6.6"
  sha256 "8e72ff59d342f190ea4d3a11d1d9972b4443121a02c29f7011dab1f619cae80c"
  bottle :unneeded

  conflicts_with "packer"

  def install
    bin.install "packer"
  end

  test do
    system "#{bin}/packer --version"
  end
end
