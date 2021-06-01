class Sentinel < Formula
  desc ""
  homepage "https://docs.hashicorp.com/sentinel"
  version "0.18.3"

  if OS.mac?
    url "https://releases.hashicorp.com/sentinel/0.18.3/sentinel_0.18.3_darwin_amd64.zip"
    sha256 "54f2040c863c93190e283d3471d7a23496d98adc55e26db945fe2d261c3d76a8"
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
    url "https://releases.hashicorp.com/sentinel/0.18.3/sentinel_0.18.3_linux_amd64.zip"
    sha256 "ba0538e049269c6f75d8c04815aee6070b061ee638135766c0ea0006a8b0c2d2"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.18.3/sentinel_0.18.3_linux_arm.zip"
    sha256 "c13df5bdefa61007c79e670de96075026368ca5f6c58955fc0f1100820a82cff"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.18.3/sentinel_0.18.3_linux_arm64.zip"
    sha256 ""
  end

  bottle :unneeded

  conflicts_with "sentinel"

  def install
    bin.install "sentinel"
  end

  test do
    system "#{bin}/sentinel --version"
  end
end
