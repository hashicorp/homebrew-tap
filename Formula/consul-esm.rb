class ConsulEsm < Formula
  desc "Consul ESM"
  homepage "https://github.com/hashicorp/consul-esm"
  version "0.6.1"

  if OS.mac?
    url "https://releases.hashicorp.com/consul-esm/0.6.1/consul-esm_0.6.1_darwin_amd64.zip"
    sha256 "c78cf14070ed827fb841c4ae2b44cd71ba0b5cb00ad1041e32928d1f9fafe193"
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
    url "https://releases.hashicorp.com/consul-esm/0.6.1/consul-esm_0.6.1_linux_amd64.zip"
    sha256 "d46a1797ecf511719d0b6e0220d7493a0dd3d559b15a81538d09f40522953e61"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-esm/0.6.1/consul-esm_0.6.1_linux_arm.zip"
    sha256 "8e59d8b8a9ad28ddc612c4864eaa270f20943f9cb375230114a9c837452d3894"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-esm/0.6.1/consul-esm_0.6.1_linux_arm64.zip"
    sha256 "8deaf6186561a6ac8d30fd3094769253beffdfae609710d3a38f7cda8e6f8937"
  end

  conflicts_with "consul-esm"

  def install
    bin.install "consul-esm"
  end

  test do
    system "#{bin}/consul-esm --version"
  end
end
