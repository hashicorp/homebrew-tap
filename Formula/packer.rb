class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"
  version "1.8.5"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.8.5/packer_1.8.5_darwin_amd64.zip"
    sha256 "eddea6a7ba1695b11341de162fdf37aa18bf0c3f12555a3f17b5920488d17c9d"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/packer/1.8.5/packer_1.8.5_darwin_arm64.zip"
    sha256 "5cf5d8a30c8412c3c06fe50414fe162fd968f700abd54d596ae3ef5539eaffb3"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.8.5/packer_1.8.5_linux_amd64.zip"
    sha256 "1f17a724e5ccc696010c842e6d2bb2c2749ab18ce7bf06482012d3ddb9edeef2"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.8.5/packer_1.8.5_linux_arm.zip"
    sha256 "c9d317e5cd1dff67757d04084077ae640c333bc9130edbdaaeb506a70929d88c"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.8.5/packer_1.8.5_linux_arm64.zip"
    sha256 "28ad00415862586bd4877b6cb5db6b4340787728dcc570456b8c4fdc482ac498"
  end

  conflicts_with "packer"

  def install
    bin.install "packer"
  end

  test do
    system "#{bin}/packer --version"
  end
end
