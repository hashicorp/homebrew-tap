class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.2.0"

  if OS.mac?
    url "https://releases.hashicorp.com/boundary/0.2.0/boundary_0.2.0_darwin_amd64.zip"
    sha256 "b7e26b1f8f4b81253f570c988c2b8cf1dcfc3ac528ccfc11caef9c283d08a567"
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
    url "https://releases.hashicorp.com/boundary/0.2.0/boundary_0.2.0_linux_amd64.zip"
    sha256 "2d397294e7db4e4eeb2696d43560be3b81674a7ea3ad2cda2c547efbbee851e1"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.2.0/boundary_0.2.0_linux_arm.zip"
    sha256 "70354d33cb9457416b76d83c38ba531c98aff94aea5c24d4ca2e6ae14e27fdd5"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.2.0/boundary_0.2.0_linux_arm64.zip"
    sha256 "6104a915ee6fbe6c95090de691ba323f42e99b707713880bc7a4a87491635950"
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
