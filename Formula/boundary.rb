class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.6.0"

  if OS.mac?
    url "https://releases.hashicorp.com/boundary/0.6.0/boundary_0.6.0_darwin_amd64.zip"
    sha256 "d02ba71b0425599af191e9252652dc28fe9ac4544833c65652753189496a4041"
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
    url "https://releases.hashicorp.com/boundary/0.6.0/boundary_0.6.0_linux_amd64.zip"
    sha256 "62dc5703df08eff2fbca5a0602f84b1ad03c05a54f53e559674a63efe6680fb4"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.6.0/boundary_0.6.0_linux_arm.zip"
    sha256 "53ed96652f0c8e3ba7dabdd07c83e9e05b98974edd1d27430ad67f2529b2c50d"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.6.0/boundary_0.6.0_linux_arm64.zip"
    sha256 "436d7a1f611ace90ae1e8b3050527f3b6b3f64f9f5d9728b4a8e6262c7d6c19c"
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
