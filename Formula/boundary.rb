class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.5.0"

  if OS.mac?
    url "https://releases.hashicorp.com/boundary/0.5.0/boundary_0.5.0_darwin_amd64.zip"
    sha256 "40343ae08ee30868cd51134733eda0a011b42cfa094a3ccdb3c54e9dd70fe6a4"
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
    url "https://releases.hashicorp.com/boundary/0.5.0/boundary_0.5.0_linux_amd64.zip"
    sha256 "c24c7647781a3da15bdaaab8102d66e5613cbfc997749ef72e4d59f9f46db397"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.5.0/boundary_0.5.0_linux_arm.zip"
    sha256 "6525351fd16fb3d29c856f61c7957b4c310b257255f8c9d83544eda22989fc11"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.5.0/boundary_0.5.0_linux_arm64.zip"
    sha256 "038f2154820d20e5e2b489b879e50998f13d7730fa0e0d70ae215556ffbab49d"
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
