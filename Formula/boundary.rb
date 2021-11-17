class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.7.0"

  if OS.mac?
    url "https://releases.hashicorp.com/boundary/0.7.0/boundary_0.7.0_darwin_amd64.zip"
    sha256 "6a7a3f0166b274471059ac6a22e1fff03cc90274443e98e6d6d7b0f858e2c033"
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
    url "https://releases.hashicorp.com/boundary/0.7.0/boundary_0.7.0_linux_amd64.zip"
    sha256 "3ba74cc32ce816fe5ac5fecdd71c760e02e87c2f85e5b0d58db81113dab4b635"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.7.0/boundary_0.7.0_linux_arm.zip"
    sha256 "88e942addb10431e58a1483298931d9df3672a1ce0b43682f39204962e4d90ff"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.7.0/boundary_0.7.0_linux_arm64.zip"
    sha256 "a5d7e08f8f7680f88b882ae7e39798df21f043374ab56a3970555c0ea81ff1c2"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
