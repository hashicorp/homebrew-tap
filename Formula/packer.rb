class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"
  version "1.8.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.8.1/packer_1.8.1_darwin_amd64.zip"
    sha256 "50220d41af4aaa65e5107fde92007d24572053949f830dfe3010eafc95017db7"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/packer/1.8.1/packer_1.8.1_darwin_arm64.zip"
    sha256 "3ffc1be5b29e90e8d5fe9a41a15ccf6a1673365b446a68bcbfb5f3f3c568ba8c"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.8.1/packer_1.8.1_linux_amd64.zip"
    sha256 "ae834c85509669c40b26033e5b2210d5594db3921103e38af1e3f537b58338a3"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.8.1/packer_1.8.1_linux_arm.zip"
    sha256 "8fb625dbe88850d856f18fd3360f904990a9c7fed7ece38e3cb30a5a1d46e4c4"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.8.1/packer_1.8.1_linux_arm64.zip"
    sha256 "1e2d018ca5c9fa705a3b9627c2104edaffbd4ba9be4e14612ad5daf4b1c32be0"
  end

  conflicts_with "packer"

  def install
    bin.install "packer"
  end

  test do
    system "#{bin}/packer --version"
  end
end
