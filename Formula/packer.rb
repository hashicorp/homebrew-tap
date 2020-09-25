class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"

  url "https://releases.hashicorp.com/packer/1.6.3/packer_1.6.3_darwin_amd64.zip"
  version "1.6.3"
  sha256 "dc476dcc49a36ee8fdd6ed8a5fdd48147b17fdf6f3d69db2d616e19b15915b73"
  bottle :unneeded

  conflicts_with "packer"

  def install
    bin.install "packer"
  end

  test do
    system "#{bin}/packer --version"
  end
end
