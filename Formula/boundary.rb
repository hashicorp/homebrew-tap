class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"

  url "https://releases.hashicorp.com/boundary/0.1.6/boundary_0.1.6_darwin_amd64.zip"

  version "0.1.6"
  sha256 "b2d4e777b144a3f44e49745a1fdbc6b77fb4b4ef45a2a9b16a0804cf5b88d1d9"
  bottle :unneeded

  # conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
