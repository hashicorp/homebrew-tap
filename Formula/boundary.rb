class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.9.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.9.0/boundary_0.9.0_darwin_amd64.zip"
    sha256 "8e4b9d87e686596495fb356881adf9df4d9f94a4b93209239f9323df93451a3f"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.9.0/boundary_0.9.0_darwin_arm64.zip"
    sha256 "163c4cbd0b3cf24083acb1f0560823229987e9676c845aaabab3ec44d41fe586"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.9.0/boundary_0.9.0_linux_amd64.zip"
    sha256 "e97c8b93e23326c5cd0cf0a65cc79790d80dcafd175d577175698b0c091da992"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.9.0/boundary_0.9.0_linux_arm.zip"
    sha256 "f611d8ddceb85c1f01bf350978be5a781f626b703e8f26b6dc41e75fdf3070f8"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.9.0/boundary_0.9.0_linux_arm64.zip"
    sha256 "216755bd18cbcbe9627caadbf8060e6d4f73659797415e013a78c1898dae702f"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
