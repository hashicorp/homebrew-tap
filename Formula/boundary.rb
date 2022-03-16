class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.7.6"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.7.6/boundary_0.7.6_darwin_amd64.zip"
    sha256 "add74d5732058fa23dc611d30595bd476c053631f2ac780f8271d4941104b612"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.7.6/boundary_0.7.6_darwin_arm64.zip"
    sha256 "e927f0c421f433427226ebdb4e505a7b3690d951600d216837c231452cc793fa"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.7.6/boundary_0.7.6_linux_amd64.zip"
    sha256 "28cf7425e6763dda3406d5ae0cf416cf1b1f7d1b938e5913c8a8fd2bd22e64ed"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.7.6/boundary_0.7.6_linux_arm.zip"
    sha256 "2f30d4cf11dd2508d1af87c4ba155827a8035e64b57f1d447689819109051ea2"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.7.6/boundary_0.7.6_linux_arm64.zip"
    sha256 "b2cf95af472383cbf552f9d3a19345a3e774d9f67b41c646f5503b48bdc85d93"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
