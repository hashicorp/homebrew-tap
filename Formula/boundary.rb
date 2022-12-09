class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.11.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.11.2/boundary_0.11.2_darwin_amd64.zip"
    sha256 "353b95e467a96460fcaa5776f75aea4bcb401fa45cc3e9c9d3f38889b235e5ce"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.11.2/boundary_0.11.2_darwin_arm64.zip"
    sha256 "49aeaaf105b32fe2e0e80938ce95c76d2848562968133102bab64f6ae3310e2a"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.11.2/boundary_0.11.2_linux_amd64.zip"
    sha256 "bc5012ba320a73a1a92a79b9646664f873d5f1447b01cae38f37e3b82a462b76"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.11.2/boundary_0.11.2_linux_arm.zip"
    sha256 "c73a7028e3277e0862a7fe8ef2b0445eef8196f7d8e539e65878b6ea5fdf2ffb"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.11.2/boundary_0.11.2_linux_arm64.zip"
    sha256 "8adf83f8f81c6c828de0ca530039657550287a83c3d7a22603747c38545317af"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
