class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"

  url "https://releases.hashicorp.com/packer/1.6.5/packer_1.6.5_darwin_amd64.zip"
  version "1.6.5"
  sha256 "8026b991720c00410ecdee1812ac7140712185a250080f3aa3647c7796d31ca1"
  bottle :unneeded

  conflicts_with "packer"

  def install
    bin.install "packer"
  end

  test do
    system "#{bin}/packer --version"
  end
end
