class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"

  url "https://releases.hashicorp.com/boundary/0.1.5/boundary_0.1.5_darwin_amd64.zip"

  version "0.1.5"
  sha256 "fff1ed548af5c56971ac6a5c37e7d1f717f24c46cf4e06b19c2b3c9275160586"
  bottle :unneeded

  # conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
