class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.1.8"

  if OS.mac?
    url "https://releases.hashicorp.com/boundary/0.1.8/boundary_0.1.8_darwin_amd64.zip"
    sha256 "decc37dbaf7723cd9b08b005e0b050a0f34334cf198f9553af5d63e133eea33f"
  end

  if OS.mac? && Hardware::CPU.arm?
    def caveats
      <<~EOS
        The darwin_arm64 architecture is not supported for this product
        at this time, however we do plan to support this in the future. The
        darwin_amd64 binary has been installed and may work in
        compatibility mode, but it is not fully supported.
      EOS
    end
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.1.8/boundary_0.1.8_linux_amd64.zip"
    sha256 "22afe6070391c9d5a5d14e32a7b438b7ccd200e4d68862c1f10145f1afb09302"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.1.8/boundary_0.1.8_linux_arm.zip"
    sha256 "ee0801e58ca9a082b91fd9328a2623c110d805da2cdc821ccd2c3e17a81d3151"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.1.8/boundary_0.1.8_linux_arm64.zip"
    sha256 "7e6d3820a78468f44f3c78c6f78be22b31d1b3054e15f79d940197efcd28edf2"
  end

  bottle :unneeded

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
