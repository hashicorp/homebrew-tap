class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.11.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.11.1/boundary_0.11.1_darwin_amd64.zip"
    sha256 "35fd33e3f7b250d4ac9a9d7ecdedf3ce0e5309bed1913bca6f44f3dfab12111c"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.11.1/boundary_0.11.1_darwin_arm64.zip"
    sha256 "bd4297cb22b48123e939117729509c2b8e378550ae699b00d89729c7b2efbe83"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.11.1/boundary_0.11.1_linux_amd64.zip"
    sha256 "b500fe5d0d616b6a720ed4803e44f44843536166b7abe459246bf1b596b06cd1"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.11.1/boundary_0.11.1_linux_arm.zip"
    sha256 "b975059ab2eeb3f3da9536d354f868ab0cb4236e3f284692981fa03ac7add020"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.11.1/boundary_0.11.1_linux_arm64.zip"
    sha256 "30d597002bb7c004363e7d6a1496c5b3232d15c26c2ef72af77dbfff13d7ffe3"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
