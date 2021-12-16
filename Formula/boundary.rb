class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.7.3"

  if OS.mac?
    url "https://releases.hashicorp.com/boundary/0.7.3/boundary_0.7.3_darwin_amd64.zip"
    sha256 "d868ec0d7839f506531c0dc3462dcbf91ffc3f5df99c5a66ea8f5bd17d83fb18"
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
    url "https://releases.hashicorp.com/boundary/0.7.3/boundary_0.7.3_linux_amd64.zip"
    sha256 "153023f558cde9c34a8ca0978433e39aeeb086eb2975c92037405eac91059558"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.7.3/boundary_0.7.3_linux_arm.zip"
    sha256 "d9713e5ed5d1c9481e09888404e4721c1f6d7144adcc5315dcb56ac5cd93b735"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.7.3/boundary_0.7.3_linux_arm64.zip"
    sha256 "754ffc9d8fcaf2985ad911937f150b899bebc12dc0dd9e1eb0c2658f2d3bfc95"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
