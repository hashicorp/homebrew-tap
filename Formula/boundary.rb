class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.7.1"

  if OS.mac?
    url "https://releases.hashicorp.com/boundary/0.7.1/boundary_0.7.1_darwin_amd64.zip"
    sha256 "eec6e8d705982fe0667c81385bb93c6ed50a3530d678a617866ca2ae60ce06ee"
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
    url "https://releases.hashicorp.com/boundary/0.7.1/boundary_0.7.1_linux_amd64.zip"
    sha256 "12d76bf496fe32075c9f89c95dffdfbd2851f617238797c70a91bd435453d5de"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.7.1/boundary_0.7.1_linux_arm.zip"
    sha256 "8a1c12fc07d097f8a5d2d29fe6f45e5d46c908c63a30d854bcb59a7ca08bfe53"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.7.1/boundary_0.7.1_linux_arm64.zip"
    sha256 "70a1ba80b58a13c225b84a104420a15a216af617ae2704e2a0ab8bcb0e839eb4"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
