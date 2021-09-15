class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"
  version "1.7.5"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.7.5/packer_1.7.5_darwin_amd64.zip"
    sha256 "24bad7889985fcdce3c729131407db122af14733cff480fea9bd3b41161a9a3a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/packer/1.7.5/packer_1.7.5_darwin_arm64.zip"
    sha256 "1cc753f56741e23a70801a44f7277e177e747f2a811ba18a8fa7ba7f05296f43"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.7.5/packer_1.7.5_linux_amd64.zip"
    sha256 "a574d20719e86d9d38854050184b78d158e62619b2a4b33b79d03b94c782dbc5"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.7.5/packer_1.7.5_linux_arm.zip"
    sha256 "e91eb2fcbe2bd295d97cc62f6718ed97f15e0e40e6d91e529b0c314eebc0f969"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.7.5/packer_1.7.5_linux_arm64.zip"
    sha256 "6aab44c24367b5d120b1beaa1fe92f53440f83e9063b15836e5c028bb2e5d6d6"
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
