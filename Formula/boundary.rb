class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.10.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.10.1/boundary_0.10.1_darwin_amd64.zip"
    sha256 "0695b596c8809558e4fae23f6d151817c38f38d1f50170a7876a8c1157ea735f"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.10.1/boundary_0.10.1_darwin_arm64.zip"
    sha256 "3204fda88ba81949aa6b3c8b6763c12edebac768a571f62719f98b251dfd8f10"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.10.1/boundary_0.10.1_linux_amd64.zip"
    sha256 "bedfa4f2e839bac918533d57081cb10b954fa82460de8df4dd057e5749b88de5"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.10.1/boundary_0.10.1_linux_arm.zip"
    sha256 "c1dd5f3528aa136010dd6521e9974811f81f8ae54f067947cb7f2fab810e9d75"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.10.1/boundary_0.10.1_linux_arm64.zip"
    sha256 "95aac4159865c662d1186f2c07fa3e7c604c9b168b777fba2fd3b003caa01aa8"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
