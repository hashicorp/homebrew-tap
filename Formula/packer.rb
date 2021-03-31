class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"
  version "1.7.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.7.1/packer_1.7.1_darwin_amd64.zip"
    sha256 "df4fce2ee7bfc7dbb636d9dc6c7fa1c998e3a526dd6c804998e86a2ee30c800f"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/packer/1.7.1/packer_1.7.1_darwin_arm64.zip"
    sha256 "ea6b46c9fcc668393182192f3ec60162cc41922c49cf1b3db4e8daa097a426e8"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.7.1/packer_1.7.1_linux_amd64.zip"
    sha256 "1afd50d8cd30290d569e07548fecfb4fe8c95994740acbc3a5b2c2246268a026"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.7.1/packer_1.7.1_linux_arm.zip"
    sha256 "a92a3c28e1bbc573b6dc0c09a25fa48514c5d7d3c910048a99d4e84905bcd88d"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.7.1/packer_1.7.1_linux_arm64.zip"
    sha256 "356edb9f326a9c44a57858d36fa60881fbef109ef52028634e92b73f2464c210"
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
