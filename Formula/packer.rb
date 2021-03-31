class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"

  url "https://releases.hashicorp.com/packer/1.7.1/packer_1.7.1_darwin_amd64.zip"
  version "1.7.1"
  sha256 "df4fce2ee7bfc7dbb636d9dc6c7fa1c998e3a526dd6c804998e86a2ee30c800f"
  bottle :unneeded

  conflicts_with "packer"

  def install
    bin.install "packer"
  end

  test do
    system "#{bin}/packer --version"
  end
end
