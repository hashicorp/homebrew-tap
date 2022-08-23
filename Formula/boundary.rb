class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.10.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.10.2/boundary_0.10.2_darwin_amd64.zip"
    sha256 "29dd3e3ad47792931cbb596f5b6099932a3281a226cd0d9a62b72f60e4623af7"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.10.2/boundary_0.10.2_darwin_arm64.zip"
    sha256 "d7198aa74e804562eb76766ce4f7469b5a21a927b8866519a49a8a9da2559e96"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.10.2/boundary_0.10.2_linux_amd64.zip"
    sha256 "8c5d3abf66ab46ef69968ccf31e0255d4d228d2d924a991008bf779529de92ca"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.10.2/boundary_0.10.2_linux_arm.zip"
    sha256 "b288224a6189bb434bf00926049be1224ff205422b53bd272f60a6adfa9f7ab8"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.10.2/boundary_0.10.2_linux_arm64.zip"
    sha256 "f487b2c1e43245dfb652633fe39c290f17542ebdff682f5b750e3f7050e658f3"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
