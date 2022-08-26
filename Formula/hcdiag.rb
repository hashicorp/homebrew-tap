class Hcdiag < Formula
  desc "Hcdiag"
  homepage "https://github.com/hashicorp/hcdiag"
  version "0.4.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcdiag/0.4.0/hcdiag_0.4.0_darwin_amd64.zip"
    sha256 "a7294b2228c7ff9ec04bff6a8ecff9acfc8d7e64a78ba1d73614b2e724eab0d5"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/hcdiag/0.4.0/hcdiag_0.4.0_darwin_arm64.zip"
    sha256 "dc2ae6fce56be41b9c7f351c0cf37c0ed5a6e464bc90c001b7ef3be6a87e50e4"
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
