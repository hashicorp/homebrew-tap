class Sentinel < Formula
  desc ""
  homepage "https://docs.hashicorp.com/sentinel"
  version "0.18.5"

  if OS.mac?
    url "https://releases.hashicorp.com/sentinel/0.18.5/sentinel_0.18.5_darwin_amd64.zip"
    sha256 "ebafbc6cfe93b13bb090be2c623f611e11ab360f95136156ce63d54ca6245bd9"
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
    url "https://releases.hashicorp.com/sentinel/0.18.5/sentinel_0.18.5_linux_amd64.zip"
    sha256 "0ee6baddf312a418685e4a48fb9a1ea3ad956358b9d328b3b7b198af6c4b9f41"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.18.5/sentinel_0.18.5_linux_arm.zip"
    sha256 "e698e1e1b195f27cfb3a7715b09fbc8e6a24ab2f2d69ed39dacf95e2ce4255af"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.18.5/sentinel_0.18.5_linux_arm64.zip"
    sha256 ""
  end

  conflicts_with "sentinel"

  def install
    bin.install "sentinel"
  end

  test do
    system "#{bin}/sentinel --version"
  end
end
