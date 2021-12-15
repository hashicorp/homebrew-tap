class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.7.2"

  if OS.mac?
    url "https://releases.hashicorp.com/boundary/0.7.2/boundary_0.7.2_darwin_amd64.zip"
    sha256 "9f693531d1511cd0212ed27489e2d530237c49eaedf97ce4a2907673f6daf0ce"
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
    url "https://releases.hashicorp.com/boundary/0.7.2/boundary_0.7.2_linux_amd64.zip"
    sha256 "80ddac98fd1b3c38ba90d0d1f412c9b2380998bce646c0356a18ec035f84d1b3"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.7.2/boundary_0.7.2_linux_arm.zip"
    sha256 "20ef259f97eb06c108712b168480920e18781514b23e145427ec0c0d6e2c6856"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.7.2/boundary_0.7.2_linux_arm64.zip"
    sha256 "3a28a517d33aba6b4db44ec13af403fd3061b83fb53a2bfc81f15ac731c93884"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
