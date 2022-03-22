class Sentinel < Formula
  desc ""
  homepage "https://docs.hashicorp.com/sentinel"
  version "0.18.8"

  if OS.mac?
    url "https://releases.hashicorp.com/sentinel/0.18.8/sentinel_0.18.8_darwin_amd64.zip"
    sha256 "6c55b0e051339d1e6f7d1ed0f0a318515bc027abe608e4ce234411607a343676"
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
    url "https://releases.hashicorp.com/sentinel/0.18.8/sentinel_0.18.8_linux_amd64.zip"
    sha256 "13149fa8503dcb476f60a94bdc5931751d00c1607fa1e1d4e90059462b7960cc"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.18.8/sentinel_0.18.8_linux_arm.zip"
    sha256 "ef82178b60bc26240a2c666c355f529fc8e99b96a19ad756afeab579603b65ca"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.18.8/sentinel_0.18.8_linux_arm64.zip"
    sha256 "1b235855aca2d92c65eb722081e941ada60eaac5bef19a719ee351fb343d0641"
  end

  conflicts_with "sentinel"

  def install
    bin.install "sentinel"
  end

  test do
    system "#{bin}/sentinel --version"
  end
end
