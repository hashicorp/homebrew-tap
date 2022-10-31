class Sentinel < Formula
  desc ""
  homepage "https://docs.hashicorp.com/sentinel"
  version "0.18.13"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.18.13/sentinel_0.18.13_darwin_amd64.zip"
    sha256 "97583fde45562ab2f6cb31029c86a080a4eefe86d99d8229132536441540df0c"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/sentinel/0.18.13/sentinel_0.18.13_darwin_arm64.zip"
    sha256 "604278234102613c1d9e2fe57235146d6f29b68cfbd6eb099e07f83f941def7e"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.18.13/sentinel_0.18.13_linux_amd64.zip"
    sha256 "0584f91f3f7e016086ed710144f415c4dfa2e37b1d68297f7423aed38ff308cf"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.18.13/sentinel_0.18.13_linux_arm.zip"
    sha256 "51532ababc1661103f8e0af6e286b13c8830df5ecffb1e76abbcbaa5c15e2ba9"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.18.13/sentinel_0.18.13_linux_arm64.zip"
    sha256 "3eec73604e1785c6dcf44172c6e2f6cb5e4c2dffe13df371008a4b909a971a2d"
  end

  conflicts_with "sentinel"

  def install
    bin.install "sentinel"
  end

  test do
    system "#{bin}/sentinel --version"
  end
end
