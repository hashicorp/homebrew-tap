class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.10.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.10.0/boundary_0.10.0_darwin_amd64.zip"
    sha256 "9ac2373b5d178c107a8e6588bfb93507edd0aa619d75b456b647ecfc5fddc89d"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.10.0/boundary_0.10.0_darwin_arm64.zip"
    sha256 "8ed05bd2ebfa0b79cd257cbde7934c92a0ee10d0c60ca178243a8101193f60b2"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.10.0/boundary_0.10.0_linux_amd64.zip"
    sha256 "88dc146eb452b3ef29ca79752a4b08c49ab99da8463bbd89af722ce3c48a3ce3"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.10.0/boundary_0.10.0_linux_arm.zip"
    sha256 "4607e8406943e6d50fb8cb9b5595e0a8a0c3fc6b276f527871a0fd17d69adb80"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.10.0/boundary_0.10.0_linux_arm64.zip"
    sha256 "cae3b47db37ab935acb90280037071c40bcfd9b73ea740a1abbe84d4764ad2ea"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
