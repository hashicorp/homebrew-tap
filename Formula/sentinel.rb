class Sentinel < Formula
  desc ""
  homepage "https://docs.hashicorp.com/sentinel"
  version "0.18.0"

  if OS.mac?
    url "https://releases.hashicorp.com/sentinel/0.18.0/sentinel_0.18.0_darwin_amd64.zip"
    sha256 "0a2390cf0bfae85ecf09f297c5bcb9a4673b315375bc02f8dba0bf83acf61dbe"
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
    url "https://releases.hashicorp.com/sentinel/0.18.0/sentinel_0.18.0_linux_amd64.zip"
    sha256 "a93de00efdc62b71f28036f03f7d167ab606c4e7fbb567a5954229f6d01e1df3"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.18.0/sentinel_0.18.0_linux_arm.zip"
    sha256 "424253bc4ec3adf855ba313c52d23f35735c12a191839057dd2aec187a1bcc77"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.18.0/sentinel_0.18.0_linux_arm64.zip"
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
