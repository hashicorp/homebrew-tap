class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"

  url "https://releases.hashicorp.com/packer/1.6.4/packer_1.6.4_darwin_amd64.zip"
  version "1.6.4"
  sha256 "320dceba07e4b36df8e05ef196edaa2b337224c8086de9240eeafa031cf92f02"
  bottle :unneeded

  conflicts_with "packer"

  def install
    bin.install "packer"
  end

  test do
    system "#{bin}/packer --version"
  end
end
