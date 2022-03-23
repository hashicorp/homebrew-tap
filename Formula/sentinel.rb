class Sentinel < Formula
  desc ""
  homepage "https://docs.hashicorp.com/sentinel"
  version "0.18.9"

  if OS.mac?
    url "https://releases.hashicorp.com/sentinel/0.18.9/sentinel_0.18.9_darwin_amd64.zip"
    sha256 "22e896d631283e2dbde09b8b4e19799c4d6ecc8a234e73c96c2aba07f685f95d"
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
    url "https://releases.hashicorp.com/sentinel/0.18.9/sentinel_0.18.9_linux_amd64.zip"
    sha256 "33e76b1a2e47d52a2fd4d2e2c339f0a397675ab0bda44d1605a616b6cf50cac6"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.18.9/sentinel_0.18.9_linux_arm.zip"
    sha256 "46e1c2b531759d2087bce430a983d21a2e1b1ced8da638d8ab2b9b60a869ba01"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.18.9/sentinel_0.18.9_linux_arm64.zip"
    sha256 "3fd0bbd6913d7ce1b16320f2b1a28a61125b31bf3a1d94002d21842f76fe6f29"
  end

  conflicts_with "sentinel"

  def install
    bin.install "sentinel"
  end

  test do
    system "#{bin}/sentinel --version"
  end
end
