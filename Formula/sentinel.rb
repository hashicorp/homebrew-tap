class Sentinel < Formula
  desc ""
  homepage "https://docs.hashicorp.com/sentinel"
  version "0.18.4"

  if OS.mac?
    url "https://releases.hashicorp.com/sentinel/0.18.4/sentinel_0.18.4_darwin_amd64.zip"
    sha256 "7ce71e5850e46e71814ba92d0ae6596bb0b89d184b7b8a59e9921e0d4d4bd72f"
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
    url "https://releases.hashicorp.com/sentinel/0.18.4/sentinel_0.18.4_linux_amd64.zip"
    sha256 "a2969317b38abc201aded53592cf931c150455aeb0061116f3459880c9d9a41a"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.18.4/sentinel_0.18.4_linux_arm.zip"
    sha256 "3484a11f83531bf3c62b670b8b6df1203b3913333dfca3e67e223b508c53423e"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.18.4/sentinel_0.18.4_linux_arm64.zip"
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
