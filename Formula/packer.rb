class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"
  version "1.7.8"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.7.8/packer_1.7.8_darwin_amd64.zip"
    sha256 "f8abe5d8660be2e6bea04bbb165ede4026e66f2f48ae5f076f9ea858699357ae"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/packer/1.7.8/packer_1.7.8_darwin_arm64.zip"
    sha256 "00fe97dc78d7d7dd8141833cad84e8c4560b59f921b2fa7a07b3dabfd1557060"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.7.8/packer_1.7.8_linux_amd64.zip"
    sha256 "8a94b84542d21b8785847f4cccc8a6da4c7be5e16d4b1a2d0a5f7ec5532faec0"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.7.8/packer_1.7.8_linux_arm.zip"
    sha256 "e9fce8a6ccaae3d7aecad55d06366730f215285bb4572acd308a09837ee4517f"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.7.8/packer_1.7.8_linux_arm64.zip"
    sha256 "b009876025c4628fdd3af4c44a660b20a91817592d19adee4300fe77695058eb"
  end

  conflicts_with "packer"

  def install
    bin.install "packer"
  end

  test do
    system "#{bin}/packer --version"
  end
end
