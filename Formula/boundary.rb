class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.10.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.10.4/boundary_0.10.4_darwin_amd64.zip"
    sha256 "ca8bcf07d011ba1b48e35d2f936db5867fbdd729be08aee4687eb5fde2bf03b1"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.10.4/boundary_0.10.4_darwin_arm64.zip"
    sha256 "12f14b4666d12e0e295fa4b17f1081f6c82a201e1393c29bd0be1aa369238646"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.10.4/boundary_0.10.4_linux_amd64.zip"
    sha256 "a4215820f0431414cd245b896343bb1f731d98233ab6544cda23edbf925e87fe"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.10.4/boundary_0.10.4_linux_arm.zip"
    sha256 "284430e2c336df65c72c10682020c1d7897203d6b1d7e3377e9d8a21da0b64b4"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.10.4/boundary_0.10.4_linux_arm64.zip"
    sha256 "626084f36b3334b1b825df33c44591787b9da2f25b1a39d456ccfaeebacb5282"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
