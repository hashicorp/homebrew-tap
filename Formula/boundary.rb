class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.3.0"

  if OS.mac?
    url "https://releases.hashicorp.com/boundary/0.3.0/boundary_0.3.0_darwin_amd64.zip"
    sha256 "ab63d10c428d7d95e5bcb0788724f8298ffe29a7c3aac464c33f7e9f58c5167d"
  end

  if OS.mac? && Hardware::CPU.arm?
    def caveats
      <<~EOS
        The darwin_arm64 architecture is not supported for this product
        at this time, however we do plan to support this in the future. The
        darwin_amd64 binary has been installed and may work in
        compatibility mode, but it is not fully supported.
      EOS
    end
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.3.0/boundary_0.3.0_linux_amd64.zip"
    sha256 "27758ae25702360f9d5a38d4e255670270719f952f47dce6469ee401f5f71f0a"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.3.0/boundary_0.3.0_linux_arm.zip"
    sha256 "1acecc361511b300113a9f6850d7f37e9636a59d5518ef1c4241f1e0918010df"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.3.0/boundary_0.3.0_linux_arm64.zip"
    sha256 "5426b9c4c6ddd8342ceb106fa17da81d1798c5ec89c4396b2fe3a3adda963107"
  end

  bottle :unneeded

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
