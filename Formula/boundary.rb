class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.8.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.8.0/boundary_0.8.0_darwin_amd64.zip"
    sha256 "27bbb5bb43fe467e056b0f62e1bd1db6d97815e2780dc918b2645d928defdba1"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.8.0/boundary_0.8.0_darwin_arm64.zip"
    sha256 "fcee7226147545c76e343839bfdca1aaa9ff9c967b1b29b6f0a8816bc4f6a9f8"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.8.0/boundary_0.8.0_linux_amd64.zip"
    sha256 "5690606abcfe3405ffda3d264b8aa1eaeafcbdb7e5cd9e98b1a11e2f75681d47"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.8.0/boundary_0.8.0_linux_arm.zip"
    sha256 "42485a4e9b40abb953f98a75434d6dea4d1befa0133b0fb1200486c85dfc6d35"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.8.0/boundary_0.8.0_linux_arm64.zip"
    sha256 "04ad9308977df4310429970370d7ef7da6c06511d39e7f7f642e4c30e82d3b77"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
