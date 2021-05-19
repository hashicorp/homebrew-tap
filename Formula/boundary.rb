class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.2.2"

  if OS.mac?
    url "https://releases.hashicorp.com/boundary/0.2.2/boundary_0.2.2_darwin_amd64.zip"
    sha256 "7915c79e33a8a18133fb191eb2c48fb5a74c27550a009fc71ae48d857fde6354"
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
    url "https://releases.hashicorp.com/boundary/0.2.2/boundary_0.2.2_linux_amd64.zip"
    sha256 "599ef6b12a2f9c8f3eba79b4c91066f7ca0a4303381cffedb0bfb1843e546361"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.2.2/boundary_0.2.2_linux_arm.zip"
    sha256 "a6f4a31a8961e36fa313aceb909e8dee9f7c434d7ed55bd18ef9e4c87aa857ad"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.2.2/boundary_0.2.2_linux_arm64.zip"
    sha256 "caf8cd81bdb4b49b198e40db866e23cb03d2323217a7e38b3dd5f6874646dd4a"
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
