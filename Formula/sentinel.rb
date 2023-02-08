class Sentinel < Formula
  desc ""
  homepage "https://docs.hashicorp.com/sentinel"
  version "0.19.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.19.4/sentinel_0.19.4_darwin_amd64.zip"
    sha256 "2b8ef04086646f29989e51d072457b07cf2b20c48db8a179fff64b8fac7725a3"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/sentinel/0.19.4/sentinel_0.19.4_darwin_arm64.zip"
    sha256 "d998fa69c4bd93daacf75742276103a69a04d08402a5899c278c56b00644a982"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.19.4/sentinel_0.19.4_linux_amd64.zip"
    sha256 "f39f90fcb710335a77ff7e95edc18a770191e02fb8f490d395f7a2c72f1797fd"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.19.4/sentinel_0.19.4_linux_arm.zip"
    sha256 "6cfa864ec1a3cd57f5893349c89044e7c72e29026ea616c1da5fff57452433fa"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.19.4/sentinel_0.19.4_linux_arm64.zip"
    sha256 "9005b429f9a6160ba78e69c018981e1ed3c465c340e176f7e6f6d60cc5617e62"
  end

  conflicts_with "sentinel"

  def install
    bin.install "sentinel"
  end

  test do
    system "#{bin}/sentinel --version"
  end
end
