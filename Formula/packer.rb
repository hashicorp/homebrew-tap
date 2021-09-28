class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"
  version "1.7.6"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.7.6/packer_1.7.6_darwin_amd64.zip"
    sha256 "dd947f2ca83e48614ea0b858455ce4dda61151c84d012af9d33179f2019cc451"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/packer/1.7.6/packer_1.7.6_darwin_arm64.zip"
    sha256 "3e9214dfae97183b0f6d24651b3a1b19e37547f6815a3266b3b02bad16f7c9c9"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.7.6/packer_1.7.6_linux_amd64.zip"
    sha256 "d2717af4d728cd9034c7a3bb2c6eac384d772bae78d856413b14742a0ca28a1c"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.7.6/packer_1.7.6_linux_arm.zip"
    sha256 "1f546ccafd81860d7f53744f696db295981fa6502438705ccc658d008374ba0e"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.7.6/packer_1.7.6_linux_arm64.zip"
    sha256 "903f428556a75bcbda73505ebbc577e4614455d9afb56b947270aa24f9bb3c4b"
  end

  bottle :unneeded

  conflicts_with "packer"

  def install
    bin.install "packer"
  end

  test do
    system "#{bin}/packer --version"
  end
end
