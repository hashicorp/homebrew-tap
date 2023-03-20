class HcInstall < Formula
  desc "hc-install CLI"
  homepage "https://github.com/hashicorp/hc-install"
  version "0.5.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hc-install/0.5.0/hc-install_0.5.0_darwin_amd64.zip"
    sha256 "e96c27d6eab442411112a70853af141172301e64b08e46f31351ebbc94f462fb"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/hc-install/0.5.0/hc-install_0.5.0_darwin_arm64.zip"
    sha256 "b5ff7ca6e8c00a5b0fbc3610341ab7140dbd86b97ca6088ea845672681dc5c8b"
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

  conflicts_with "hc-install"

  def install
    bin.install "hc-install"
  end

  test do
    system "#{bin}/hc-install --help"
  end
end
