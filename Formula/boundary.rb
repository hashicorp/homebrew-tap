class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.8.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.8.1/boundary_0.8.1_darwin_amd64.zip"
    sha256 "a1e234518d1fff459aa3745275f9e5d2668dd4adb65f979883dc8d28e8a0c4f9"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.8.1/boundary_0.8.1_darwin_arm64.zip"
    sha256 "021ad3517dd7229a92f23b9c22b6bd2027532054fda8d4b5258bc4e18e1897d5"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.8.1/boundary_0.8.1_linux_amd64.zip"
    sha256 "d50e8f0483e39e596b3ff5f37316bffe33ae78a07bed51c9b6ccdb0e3d3230cc"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.8.1/boundary_0.8.1_linux_arm.zip"
    sha256 "b6d1fcdead971b3d1882b36f82f24713b694ad47749d2c393ebea2c2ba757377"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.8.1/boundary_0.8.1_linux_arm64.zip"
    sha256 "a5235d8fe7c08bdb52acbd7a4e4b33dad1fabe0769576cc69d2fc5cb848e3b72"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
