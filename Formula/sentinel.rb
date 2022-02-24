class Sentinel < Formula
  desc ""
  homepage "https://docs.hashicorp.com/sentinel"
  version "0.18.7"

  if OS.mac?
    url "https://releases.hashicorp.com/sentinel/0.18.7/sentinel_0.18.7_darwin_amd64.zip"
    sha256 "36d7925583a74d576cde13fe180c897c9ec5b2906c26b01aef033bad48a68467"
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
    url "https://releases.hashicorp.com/sentinel/0.18.7/sentinel_0.18.7_linux_amd64.zip"
    sha256 "e9e8198c64af60caa5170ab2c0160ebc9269b87cc9c4bb0b729ad247ed061e47"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.18.7/sentinel_0.18.7_linux_arm.zip"
    sha256 "c4bd3bf874fe0edc6d3fd2fc098d627e786a73774e9a528fb56c0cdb9cf52a14"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.18.7/sentinel_0.18.7_linux_arm64.zip"
    sha256 "ebeb9f04621cfbdd54585731cdfc65695319bc0d696baed8c52551412fbd8fcc"
  end

  conflicts_with "sentinel"

  def install
    bin.install "sentinel"
  end

  test do
    system "#{bin}/sentinel --version"
  end
end
