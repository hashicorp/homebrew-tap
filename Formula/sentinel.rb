class Sentinel < Formula
  desc ""
  homepage "https://docs.hashicorp.com/sentinel"
  version "0.18.6"

  if OS.mac?
    url "https://releases.hashicorp.com/sentinel/0.18.6/sentinel_0.18.6_darwin_amd64.zip"
    sha256 "c2d30dbd88bcd4099b81f9b08ce56e40b8be94a8d55a6f951477a7cc0002e74b"
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
    url "https://releases.hashicorp.com/sentinel/0.18.6/sentinel_0.18.6_linux_amd64.zip"
    sha256 "08c22adaf84a95c93a2383cb8409a8b79c7a7275c1d7e36b02e8517239aa5318"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.18.6/sentinel_0.18.6_linux_arm.zip"
    sha256 "f9104d49931809b8f6e5a7d21afb2129bf293fa6b9e5932cb78f275a66d15237"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.18.6/sentinel_0.18.6_linux_arm64.zip"
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
