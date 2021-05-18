class Sentinel < Formula
  desc ""
  homepage "https://docs.hashicorp.com/sentinel"
  version "0.18.2"

  if OS.mac?
    url "https://releases.hashicorp.com/sentinel/0.18.2/sentinel_0.18.2_darwin_amd64.zip"
    sha256 "a7cbb9e7b614d3deb737a9381a5241235483a1b25a0c017f9fe1de0753ab606a"
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
    url "https://releases.hashicorp.com/sentinel/0.18.2/sentinel_0.18.2_linux_amd64.zip"
    sha256 "031ccdd6f34f00a657fba7af231192628ef1abebe5b2355e22b17a2d4d212e28"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.18.2/sentinel_0.18.2_linux_arm.zip"
    sha256 "44b19c10c870cd1479f9853c0ac742c06055e6174979d52095a8dad833e9d1d8"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.18.2/sentinel_0.18.2_linux_arm64.zip"
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
