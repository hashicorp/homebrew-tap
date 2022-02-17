class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.7.5"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.7.5/boundary_0.7.5_darwin_amd64.zip"
    sha256 "9e9ce0e5f501748170ef126fdca61019151f331a2ee3549cdfd0fba56706bfc8"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.7.5/boundary_0.7.5_darwin_arm64.zip"
    sha256 "c78b0c2bce19acba3701dc5ac87c499a1aa27890076bcf4ab53f243119056e56"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.7.5/boundary_0.7.5_linux_amd64.zip"
    sha256 "f5eb5fe62aaeeded91448c1cffd9442ea4f6f79c2820a387bcb2d6d72e982eac"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.7.5/boundary_0.7.5_linux_arm.zip"
    sha256 "c633ed23b2a5ad1c6891d6f20aae380d51da94258dcf0f07356274d89e3319d2"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.7.5/boundary_0.7.5_linux_arm64.zip"
    sha256 "a604d80b596d8b05ad903cd6b869a10422667211dab13c6d34cd4179b11f9230"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
