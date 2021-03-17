class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"

  url "https://releases.hashicorp.com/boundary/0.1.8/boundary_0.1.8_darwin_amd64.zip"

  version "0.1.8"
  sha256 "decc37dbaf7723cd9b08b005e0b050a0f34334cf198f9553af5d63e133eea33f"
  bottle :unneeded

  # conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
