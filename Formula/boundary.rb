class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"

  url "https://releases.hashicorp.com/boundary/0.1.4/boundary_0.1.4_darwin_amd64.zip"

  version "0.1.4"
  sha256 "fc89a13b8b3a2bd5276614119283d33d1356821dad80e3d880e1db42ee60810f"
  bottle :unneeded

  # conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
