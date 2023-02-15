class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"
  version "1.8.6"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.8.6/packer_1.8.6_darwin_amd64.zip"
    sha256 "0647038561ac14e87bae81e578d575755598346ed3e272ac98cb2949ca4cd852"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/packer/1.8.6/packer_1.8.6_darwin_arm64.zip"
    sha256 "d7497f1ba3c6221feb4a38a960626afbc4eb26552fc40d941bff57cc2b83bd59"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.8.6/packer_1.8.6_linux_amd64.zip"
    sha256 "57d0411e578aea62918d36ed186951139d5d49d44b76e5666d1fbf2427b385ae"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.8.6/packer_1.8.6_linux_arm.zip"
    sha256 "538e355a9a64ed49b00f06a19eac28b9bba5b99d1e44c67873400acf8c10e3cb"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.8.6/packer_1.8.6_linux_arm64.zip"
    sha256 "6f28ade0040fa40fdb19966bbb87dddc5b289d7aa90c6503638d61baaea54d19"
  end

  conflicts_with "packer"

  def install
    bin.install "packer"
  end

  test do
    system "#{bin}/packer --version"
  end
end
