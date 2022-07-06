class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.9.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.9.1/boundary_0.9.1_darwin_amd64.zip"
    sha256 "a439461bf9af078ca86e7c25161cbb5e12c097c85ae4bd0a2ffadc0f9be95e77"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.9.1/boundary_0.9.1_darwin_arm64.zip"
    sha256 "a1de657f8b4a6aeb10b08a16902813c9fa2bda66b56d4f2b39e21cc10e51e1ca"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.9.1/boundary_0.9.1_linux_amd64.zip"
    sha256 "cbe308791f917a02430ac3eb7fa651a3031dd74000e7eea3f932db61b366baa0"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.9.1/boundary_0.9.1_linux_arm.zip"
    sha256 "97d0acd30b59bb0f5a320f7d888863ffe7f4afc1ef1c877c30a10818aee4697e"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.9.1/boundary_0.9.1_linux_arm64.zip"
    sha256 "7f8d063fe07addeab3c5155317f955d53513215f16348b546e7651d1aa2f83e5"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
