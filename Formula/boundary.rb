class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.10.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.10.3/boundary_0.10.3_darwin_amd64.zip"
    sha256 "f0796dcfa6008d99f1e8467c19e579ef056ba87d09281c2acfc8b37633c4590a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.10.3/boundary_0.10.3_darwin_arm64.zip"
    sha256 "933d66702a8d073df77a36c5f590e235f64bd40bfc4c6e992061bdf39de23e48"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.10.3/boundary_0.10.3_linux_amd64.zip"
    sha256 "b5672b396d631e8dfb01337fe4ad9dffb4440fbb1e3cf80205f048f77c817dc9"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.10.3/boundary_0.10.3_linux_arm.zip"
    sha256 "712be9f64b82c7f28b82f930711c8b489fe28a3cb5f288835052eea62b4239ce"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.10.3/boundary_0.10.3_linux_arm64.zip"
    sha256 "0c41433d28ca3ae15dda1a21eed43a5a5e5eb529dff72bdece10e8f888aef3ff"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
