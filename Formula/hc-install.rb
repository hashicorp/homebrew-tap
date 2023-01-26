class HcInstall < Formula
  desc "hc-install CLI"
  homepage "https://github.com/hashicorp/hc-install"
  version "0.5.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hc-install/0.5.0/hc-install_0.5.0_darwin_amd64.zip"
    sha256 "a3c41de2652861af842391c7d580f4284026b5536ed0b12beb49fa4b2bd3fc8a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/hc-install/0.5.0/hc-install_0.5.0_darwin_arm64.zip"
    sha256 "f19618af732827f9af7e3b25e3f079b150129736d8046889fbb3e9cf6dad2e5c"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hc-install/0.5.0/hc-install_0.5.0_linux_amd64.zip"
    sha256 "177a2ca5c649b03c3d9085c54c22b207f81ebec05d3f5b0d4a62c0fa2de8669f"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hc-install/0.5.0/hc-install_0.5.0_linux_arm.zip"
    sha256 "49d8c2e649e877f891913e657ead7b285a27dee66719c374ea67397f82fa23cf"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hc-install/0.5.0/hc-install_0.5.0_linux_arm64.zip"
    sha256 "dff0aa9bf8d6668a5daa3436d520f5ce0b7f7d9d4d9226cf668500d0fe356f4d"
  end

  def install
    bin.install "hc-install"
  end

  test do
    system "#{bin}/hc-install --help"
  end
end
