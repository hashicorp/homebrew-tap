class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"
  version "1.8.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.8.4/packer_1.8.4_darwin_amd64.zip"
    sha256 "c6665df0e967757e7504ac8956ca2d1fe47e4c63f0b0c500a3ff04d7f8ece389"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/packer/1.8.4/packer_1.8.4_darwin_arm64.zip"
    sha256 "e74cc720c1ca1fc51dbf50d6848d5dab34f8c68d4bb12ffbfaa08753862a6a61"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.8.4/packer_1.8.4_linux_amd64.zip"
    sha256 "ba25b84cc4d3541e9a1dcc0b8e1c7c693f1b39a5d129149194eb6b6050ae56c3"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.8.4/packer_1.8.4_linux_arm.zip"
    sha256 "25f742fe68f45927b033bfb0c6db1266c767bcf8fb64d53325ec449d39bcbb1f"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.8.4/packer_1.8.4_linux_arm64.zip"
    sha256 "13c1895b7e09123d7d45d646b21dc5c194335204c56d8a29851a76e196f39be0"
  end

  conflicts_with "packer"

  def install
    bin.install "packer"
  end

  test do
    system "#{bin}/packer --version"
  end
end
