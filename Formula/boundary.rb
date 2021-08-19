class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.5.1"

  if OS.mac?
    url "https://releases.hashicorp.com/boundary/0.5.1/boundary_0.5.1_darwin_amd64.zip"
    sha256 "85245fbed99ec5520af0fec7b0b7d7bbeadec8ae53dff3e34b020fa825dab7d3"
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
    url "https://releases.hashicorp.com/boundary/0.5.1/boundary_0.5.1_linux_amd64.zip"
    sha256 "cb0a00f1a85e9598eb0c5572b843e37ebed768f4d19cb0c9240d612fe62654af"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.5.1/boundary_0.5.1_linux_arm.zip"
    sha256 "ab3e0090cb56eb866d8f1d9907d697260d8a6a4efb619a627925043fbbca85f5"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.5.1/boundary_0.5.1_linux_arm64.zip"
    sha256 "03781fc7635cb796137c35dfc75caba0f096b015f8c5b71c92c4eb87867feda5"
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
