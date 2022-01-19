class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"
  version "1.7.9"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.7.9/packer_1.7.9_darwin_amd64.zip"
    sha256 "d7276d02d5ef542f86d4e2ab0c4b3a2333b4f7519b0f48d8092f9a27aef1f459"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/packer/1.7.9/packer_1.7.9_darwin_arm64.zip"
    sha256 "178c2ec4d6205948fa1ba19e9ab2235f6633f881c062d9f441ddd85a0022b5a4"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.7.9/packer_1.7.9_linux_amd64.zip"
    sha256 "f89ed2e5f2becd391c7f0a9e51b79f3ea8a47fc4b486f1f54c3087e291d3f111"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.7.9/packer_1.7.9_linux_arm.zip"
    sha256 "f80ebbc3a02cc7fe8b3b50ae0138b0efa1b7ec40aa4a1ffdabd735cc2009b3aa"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.7.9/packer_1.7.9_linux_arm64.zip"
    sha256 "7c595ac4590e5152094aa04c0afb00a597eda0fbae3979e087acc19f6bd2d26e"
  end

  conflicts_with "packer"

  def install
    bin.install "packer"
  end

  test do
    system "#{bin}/packer --version"
  end
end
