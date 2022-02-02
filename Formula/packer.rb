class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"
  version "1.7.10"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.7.10/packer_1.7.10_darwin_amd64.zip"
    sha256 "8ad75741499fce537de41938faf948ff03e2e671a015afeca3c37b960a0f5a51"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/packer/1.7.10/packer_1.7.10_darwin_arm64.zip"
    sha256 "89145519106c8d3cf209c819d3abf9578ba712ef88385e236d8aa72e56bfedc7"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.7.10/packer_1.7.10_linux_amd64.zip"
    sha256 "1c8c176dd30f3b9ec3b418f8cb37822261ccebdaf0b01d9b8abf60213d1205cb"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.7.10/packer_1.7.10_linux_arm.zip"
    sha256 "6da48ac438997cc824f8f6c0be75caceebcc8bcebc7f1c54d1a62699fc388b9b"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.7.10/packer_1.7.10_linux_arm64.zip"
    sha256 "541e769c0582be48b15676e263461e1da85c312c35fa3decbcd08115371a8f80"
  end

  conflicts_with "packer"

  def install
    bin.install "packer"
  end

  test do
    system "#{bin}/packer --version"
  end
end
