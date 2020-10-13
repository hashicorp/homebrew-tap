class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"

  url "https://releases.hashicorp.com/boundary/0.1.0/boundary_0.1.0_darwin_amd64.zip"

  version "0.1.0"
  sha256 "fb8c64f98ac222ddd723c9c043a6afe5f50609080e549d82563c81d006c77271"
  bottle :unneeded

  # conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
