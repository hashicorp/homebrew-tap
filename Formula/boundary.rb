class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.11.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.11.2/boundary_0.11.2_darwin_amd64.zip"
    sha256 "764da314a000e63babc8fb4d45927c55178b32ec5e4777455fdf006767f9b00a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.11.2/boundary_0.11.2_darwin_arm64.zip"
    sha256 "ccdaa1c61ea37c8998b184f087e4031cc006e88ea2b26429facab1289e1f36bf"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.11.2/boundary_0.11.2_linux_amd64.zip"
    sha256 "bc5012ba320a73a1a92a79b9646664f873d5f1447b01cae38f37e3b82a462b76"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.11.2/boundary_0.11.2_linux_arm.zip"
    sha256 "c73a7028e3277e0862a7fe8ef2b0445eef8196f7d8e539e65878b6ea5fdf2ffb"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.11.2/boundary_0.11.2_linux_arm64.zip"
    sha256 "8adf83f8f81c6c828de0ca530039657550287a83c3d7a22603747c38545317af"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
