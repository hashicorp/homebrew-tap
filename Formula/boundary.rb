class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.6.2"

  if OS.mac?
    url "https://releases.hashicorp.com/boundary/0.6.2/boundary_0.6.2_darwin_amd64.zip"
    sha256 "0ca0c4ae90fa68ae38ec930a97965ca692bfcb2a0e039e58d60edc5d5386778d"
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
    url "https://releases.hashicorp.com/boundary/0.6.2/boundary_0.6.2_linux_amd64.zip"
    sha256 "42a7c865c5970e311a9222629bbbdeaec6e7ea315f7e843793dd3cc1b84db240"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.6.2/boundary_0.6.2_linux_arm.zip"
    sha256 "335fd9d9f73aa8def51a3f78910555e0d3504a7e5b3ef7c8b48356f7620519ee"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.6.2/boundary_0.6.2_linux_arm64.zip"
    sha256 "6979dfad5bd7e12503c75858a82603adb1ff8c5a5a902a101f81a794f7052386"
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
