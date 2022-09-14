class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.10.5"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.10.5/boundary_0.10.5_darwin_amd64.zip"
    sha256 "eab3fbfafd8b2c29e478d427e430c149f39fab7c38e53482f21d7964dd4005ae"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.10.5/boundary_0.10.5_darwin_arm64.zip"
    sha256 "cb7db36865b0f3426ee7237e50bcbe4e26386c454d14e709b79cce25e45581ef"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.10.5/boundary_0.10.5_linux_amd64.zip"
    sha256 "433fd79b9981c0426a99195f9194229d62e22fcb17ef77ee082c7e7e72543eb3"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.10.5/boundary_0.10.5_linux_arm.zip"
    sha256 "4b592dc236332f52f7253c6ca88e58b7e9f9d8ca58c9af21f74863b08447968b"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.10.5/boundary_0.10.5_linux_arm64.zip"
    sha256 "a9fbe3c23e967ea6da6617f933e8e4d1b19c902ff9145d44414c8737e8a8bc9b"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
