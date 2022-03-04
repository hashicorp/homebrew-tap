class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"
  version "1.8.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.8.0/packer_1.8.0_darwin_amd64.zip"
    sha256 "2c0ec4e75f54600e3796feb8f3411f7f576af005fecbd2e3d2c530d1316a4ca6"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/packer/1.8.0/packer_1.8.0_darwin_arm64.zip"
    sha256 "4374e8f1990adf926da3ee573fd2d13a721563080b040f7bbf31de8a3fadc503"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.8.0/packer_1.8.0_linux_amd64.zip"
    sha256 "94c5d65386fa8f17e36d3496fbbdf18d3bfab01306aa8000c14656b63070b7c2"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.8.0/packer_1.8.0_linux_arm.zip"
    sha256 "a00c11f3e19d6e1727d5d34d17c55a591c32436a67be6880919560bcd0ef00b6"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.8.0/packer_1.8.0_linux_arm64.zip"
    sha256 "8b3a8768021b148ada2cbdf1c39f55d92e4280147ceb5f76f840a7adf50edce2"
  end

  conflicts_with "packer"

  def install
    bin.install "packer"
  end

  test do
    system "#{bin}/packer --version"
  end
end
