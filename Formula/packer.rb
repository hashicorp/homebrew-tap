class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"
  version "1.8.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.8.2/packer_1.8.2_darwin_amd64.zip"
    sha256 "5bb1daa50f503b49bad15c99a1ca90c32d21f3a6c02c5e763980d9b447d71b5d"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/packer/1.8.2/packer_1.8.2_darwin_arm64.zip"
    sha256 "f70cac04528ccdd4a1c0cafc8bb15b53c342e50e7e903e4b6657119f1c419681"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.8.2/packer_1.8.2_linux_amd64.zip"
    sha256 "675bd82561a2e49f89747e092141c7ce79c2e2a9105e6a2ebd49a26df849a468"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.8.2/packer_1.8.2_linux_arm.zip"
    sha256 "c1d77dde21327b12ae24b85a175918a6c4fb001669c3867373cdc3f968bb28e8"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.8.2/packer_1.8.2_linux_arm64.zip"
    sha256 "35c9b45dfd14bffd95601a518d70c2830ad362e75c8aefb752c89fd232f88beb"
  end

  conflicts_with "packer"

  def install
    bin.install "packer"
  end

  test do
    system "#{bin}/packer --version"
  end
end
