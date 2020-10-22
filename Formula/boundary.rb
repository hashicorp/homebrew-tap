class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"

  url "https://releases.hashicorp.com/boundary/0.1.1/boundary_0.1.1_darwin_amd64.zip"

  version "0.1.1"
  sha256 "05614979e559f6ea447c4a2d7e1e96c869527e34350203fb907c930b32528429"
  bottle :unneeded

  # conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
