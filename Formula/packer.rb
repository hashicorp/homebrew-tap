class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"

  url "https://releases.hashicorp.com/packer/1.7.0/packer_1.7.0_darwin_amd64.zip"
  version "1.7.0"
  sha256 "dbc60dde571ccb374bc35f1a26cf63ab4ea5dd78d3fb805cc4b9eaa990ffd112"
  bottle :unneeded

  conflicts_with "packer"

  def install
    bin.install "packer"
  end

  test do
    system "#{bin}/packer --version"
  end
end
