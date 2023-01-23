class Hcdiag < Formula
  desc "Hcdiag"
  homepage "https://github.com/hashicorp/hcdiag"
  version "0.4.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcdiag/0.4.0/hcdiag_0.4.0_darwin_amd64.zip"
    sha256 "5f5ccc8c2197c67a75bfa64596f2942a72483b36bb4bdc9e23853448e4203666"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/hcdiag/0.4.0/hcdiag_0.4.0_darwin_arm64.zip"
    sha256 "8fc38094df5d5ec497d95338c77b0f439d3adfee0f040221eb0a38b6ab1c382a"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcdiag/0.4.0/hcdiag_0.4.0_linux_amd64.zip"
    sha256 "3b0fe012a1475779256002339b935697fe49ae60d29b73955dde5c33429776e7"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcdiag/0.4.0/hcdiag_0.4.0_linux_arm.zip"
    sha256 "cec326c21e0ded819c6faf35ab889bccdc3e7d0ce20b396860e6a6ccf1fa57bd"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcdiag/0.4.0/hcdiag_0.4.0_linux_arm64.zip"
    sha256 "a863b418e0a39224b2bb82f3f0ed99f633073295e59928c857648c021b7e33ce"
  end

  conflicts_with "hcdiag"

  def install
    bin.install "hcdiag"
  end

  test do
    system "#{bin}/hcdiag --version"
  end
end
