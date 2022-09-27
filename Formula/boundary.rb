class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.11.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.11.0/boundary_0.11.0_darwin_amd64.zip"
    sha256 "369dff827c4296fee804f7846e140be628ee16df5df95031aa11f2e8349da62e"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.11.0/boundary_0.11.0_darwin_arm64.zip"
    sha256 "d4f84b628403293c8dc70bd6cc78fe7944782d8493b097b2dbf186564ffda232"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.11.0/boundary_0.11.0_linux_amd64.zip"
    sha256 "0eb60ba3b945415d13124cbb1639e038e120a9aa1ca8dc8bc229cdd58abc4988"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.11.0/boundary_0.11.0_linux_arm.zip"
    sha256 "483591add675836416c99ac84de9ccd0d327895fbe8a2741342c1956a67afc6d"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.11.0/boundary_0.11.0_linux_arm64.zip"
    sha256 "3688c79657308f184b4b709e0b3c374d7be53648bc0e8f91433663ab01e46707"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
