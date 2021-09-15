class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.6.1"

  if OS.mac?
    url "https://releases.hashicorp.com/boundary/0.6.1/boundary_0.6.1_darwin_amd64.zip"
    sha256 "607c46bd428f3de24c8e02877c3617436a9f848bf02bb1da6830031219294348"
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
    url "https://releases.hashicorp.com/boundary/0.6.1/boundary_0.6.1_linux_amd64.zip"
    sha256 "95c7375e1b96ba52aa323888d525e25e28cd749334ff908391c3d0f45f7eba03"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.6.1/boundary_0.6.1_linux_arm.zip"
    sha256 "5079d73a1d2aed57e09163928d661b2243b9bd10e6dacf76e90b75f353f6af4c"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.6.1/boundary_0.6.1_linux_arm64.zip"
    sha256 "caa2c8cc56b6c7e9bee0079ed7240c826d19801e459bbc79f16598245daeffb3"
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
