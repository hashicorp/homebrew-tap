class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"
  version "1.8.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.8.3/packer_1.8.3_darwin_amd64.zip"
    sha256 "b5a06ae784895dcf24c64c8a835bf1e8cfb178d0304f55d91c3176cfabe210d9"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/packer/1.8.3/packer_1.8.3_darwin_arm64.zip"
    sha256 "1715d36c110a64ec7d4467e5f933115fecb4380a90f11b4e80f0399753f86b17"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.8.3/packer_1.8.3_linux_amd64.zip"
    sha256 "0587f7815ed79589cd9c2b754c82115731c8d0b8fd3b746fe40055d969facba5"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.8.3/packer_1.8.3_linux_arm.zip"
    sha256 "a1dcaa97bb9ce93fe9f057733aab8ccef6bf4f2ef520236b7dcad4d90d4030a1"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.8.3/packer_1.8.3_linux_arm64.zip"
    sha256 "edb096a34b88193294cb92deaac7ea4f67dfdeb21b0810d9b08a439f6767c2db"
  end

  conflicts_with "packer"

  def install
    bin.install "packer"
  end

  test do
    system "#{bin}/packer --version"
  end
end
