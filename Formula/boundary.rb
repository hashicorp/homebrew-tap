class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.12.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.12.1/boundary_0.12.1_darwin_amd64.zip"
    sha256 "e8bb2ae1d36b4399f1ca11a18b4e7a4af92fc09bcbcfea66d55f2ba557e5db18"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.12.1/boundary_0.12.1_darwin_arm64.zip"
    sha256 "52eee3df50ab6508011058d1aca6cad92ed3f6f4c45cae9e1159901784251a87"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.12.1/boundary_0.12.1_linux_amd64.zip"
    sha256 "dd790539170b0a8d00553a0a01c424cf16e44c73c780e286ec335df19c7457bd"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.12.1/boundary_0.12.1_linux_arm.zip"
    sha256 "8c8e56c16954952632ee0465ec417d2940d15d517ad8ff2ae4a78199e36d7fbd"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.12.1/boundary_0.12.1_linux_arm64.zip"
    sha256 "2d59ee8a66078840059b5cdde58e87c1bf4f8f49d1974936b256aabe0f1e95fa"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
