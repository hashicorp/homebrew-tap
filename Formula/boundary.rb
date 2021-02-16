class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"

  url "https://releases.hashicorp.com/boundary/0.1.7/boundary_0.1.7_darwin_amd64.zip"

  version "0.1.7"
  sha256 "adf8dc8696119b0455951e7f05a480804e0239c0ac82c2e14404d28bfcec67e3"
  bottle :unneeded

  # conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
