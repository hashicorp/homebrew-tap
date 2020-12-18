class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"

  url "https://releases.hashicorp.com/boundary/0.1.3/boundary_0.1.3_darwin_amd64.zip"

  version "0.1.3"
  sha256 "ff7c62dec73d5aebf3ed03fc0484a4a1038c3f8f9e8f5fea77a1372de3e5b1a6"
  bottle :unneeded

  # conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
