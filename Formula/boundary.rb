class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.2.1"

  if OS.mac?
    url "https://releases.hashicorp.com/boundary/0.2.1/boundary_0.2.1_darwin_amd64.zip"
    sha256 "9b90c0de96243574063e322448b9d001de5ce1c326ca1c65b3f3209f3746655b"
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
    url "https://releases.hashicorp.com/boundary/0.2.1/boundary_0.2.1_linux_amd64.zip"
    sha256 "718ec76d17982606f1a8db8f5667f49ea498e7ce18990cccd669f3f65f0b58c4"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.2.1/boundary_0.2.1_linux_arm.zip"
    sha256 "273383309334f8da5464f863bc8b6bc3552fbc59e685299712e31899fc338246"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.2.1/boundary_0.2.1_linux_arm64.zip"
    sha256 "1af92dcd228d10363970caf6b538d8ed00f727dbc1999d5462eaf406cf4e3ca9"
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
