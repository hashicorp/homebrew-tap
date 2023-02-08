class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.12.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.12.0/boundary_0.12.0_darwin_amd64.zip"
    sha256 "35e2b66764f693294a3e0136d12cab88b1f14d6d65d7adf01d9493e09b885fc1"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.12.0/boundary_0.12.0_darwin_arm64.zip"
    sha256 "feba7f4285bbebc9ad5d667f490eaeeb31b5fbb1732676b96f6dacc92eea322f"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.12.0/boundary_0.12.0_linux_amd64.zip"
    sha256 "f74bbbb7ae86b02caf6033502ab77d1fbc0ea38c4d0351ccb56894385269eee3"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.12.0/boundary_0.12.0_linux_arm.zip"
    sha256 "6a9620447efbbaf3a14c2cff48fc922e17c302ce890f585b37dfa3cb04e65bd5"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.12.0/boundary_0.12.0_linux_arm64.zip"
    sha256 "138e7c1ca02747ea26849d0ddfe96c10c908b88d0d6d714c09656b3e7e695451"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
