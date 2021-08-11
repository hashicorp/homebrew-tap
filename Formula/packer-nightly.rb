class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"
  version "nightly"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/hashicorp/packer/releases/download/nightly/packer_darwin_amd64.zip"
    sha256 "ea9b8058dc3e0d17b77fe1af997d71c6910e719cc468b0e2bc4bc378285258cd"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/hashicorp/packer/releases/download/nightly/packer_darwin_arm64.zip"
    sha256 "27557e63306bf34236e84c917a71e8336fce94d356a99353f0d88ce7e56a79f4"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/hashicorp/packer/releases/download/nightly/packer_linux_amd64.zip"
    sha256 "0f26deb6f79ab34bd0d8207e640cb730afbad456ebab05771e3f0f89965ca722"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://github.com/hashicorp/packer/releases/download/nightly/packer_linux_arm.zip"
    sha256 "cfa4b4a25152a96e4d28fd59a6626eb61b3645c0f191265ee42f931805abe136"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/hashicorp/packer/releases/download/nightly/packer_linux_arm64.zip"
    sha256 "018b0e433662969152354568404081c18486d3c2a79058089ab85c211848e790"
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
