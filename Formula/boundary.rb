class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.2.3"

  if OS.mac?
    url "https://releases.hashicorp.com/boundary/0.2.3/boundary_0.2.3_darwin_amd64.zip"
    sha256 "01d809a900950ea58d17a7fed7a27e676c3fa0f0a07a82bdf6449372fd164240"
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
    url "https://releases.hashicorp.com/boundary/0.2.3/boundary_0.2.3_linux_amd64.zip"
    sha256 "59bedce0111e3e2a3f64dddd2b6152e3314d7e7d141732afa4f9eff5b6293a0a"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.2.3/boundary_0.2.3_linux_arm.zip"
    sha256 "57b03c345749791e1138094b93c26e34d06b094ae5dabed1c62e59f722159a4a"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.2.3/boundary_0.2.3_linux_arm64.zip"
    sha256 "684a41b917c69054b9c01392a889aecd056f3d6a9c1b1d66d59612226a5b8853"
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
