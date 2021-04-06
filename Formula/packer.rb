class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"
  version "1.7.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.7.2/packer_1.7.2_darwin_amd64.zip"
    sha256 "2dd688672157eed5d9f5126b1dd160862926ab698dc91e4ffb5a7fc2deb0b037"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/packer/1.7.2/packer_1.7.2_darwin_arm64.zip"
    sha256 "ee541b7827d7991fbac6da2e37ecd063051b8b10011734a7e2bcdc1e2d51ed73"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.7.2/packer_1.7.2_linux_amd64.zip"
    sha256 "9429c3a6f80b406dbddb9b30a4e468aeac59ab6ae4d09618c8d70c4f4188442e"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.7.2/packer_1.7.2_linux_arm.zip"
    sha256 "bf500157f7f7af06cdf986f1f9e272032d26d06ffd0c79d0b924c1641a05e5ae"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.7.2/packer_1.7.2_linux_arm64.zip"
    sha256 "01447792528b700d315e678d837a84aa648bb9b4218e2798013db06ddedd7d61"
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
