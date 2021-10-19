class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"
  version "1.7.7"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.7.7/packer_1.7.7_darwin_amd64.zip"
    sha256 "618f20f3931a6ff5e8d7412290121b90537554af5ebbbae6c6a77ad50bee2ef6"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/packer/1.7.7/packer_1.7.7_darwin_arm64.zip"
    sha256 "903f92543b2d7e1306d58159b75b96af693e1a061710c06937d7782d17d4bfb1"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.7.7/packer_1.7.7_linux_amd64.zip"
    sha256 "8513c3679d51141c39da3d95c691fcfc4b2ccc20e96ac5244b58b98899d6fe54"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.7.7/packer_1.7.7_linux_arm.zip"
    sha256 "27aefc9f6235817163d31fec582b84dc676431049448a584b371b9307b822433"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.7.7/packer_1.7.7_linux_arm64.zip"
    sha256 "c44d4f4c6776154a95a700c4b8caefb07c96652deb4ca6b265d19d767b31faeb"
  end

  conflicts_with "packer"

  def install
    bin.install "packer"
  end

  test do
    system "#{bin}/packer --version"
  end
end
