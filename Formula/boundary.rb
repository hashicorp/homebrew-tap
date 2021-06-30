class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.4.0"

  if OS.mac?
    url "https://releases.hashicorp.com/boundary/0.4.0/boundary_0.4.0_darwin_amd64.zip"
    sha256 "cc36896ff37dcdc06e5a991af4f641fc3d7b569cef8ecb9ff1dfd84fa57f0e9b"
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
    url "https://releases.hashicorp.com/boundary/0.4.0/boundary_0.4.0_linux_amd64.zip"
    sha256 "3a7242a9d9e577af7ec023b53713599e2b9d24d68a0b06b12ddd7d297fe909c2"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.4.0/boundary_0.4.0_linux_arm.zip"
    sha256 "e1dfb282349bdd8731230f154554328f36c7305e395975da6d08f2be6334f1b2"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.4.0/boundary_0.4.0_linux_arm64.zip"
    sha256 "206a1e808e0a07357fa4965605e3a9017cacd5b4ae8d06d53c506bbee13e9bf6"
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
