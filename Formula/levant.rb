class Levant < Formula
  desc "Levant"
  homepage "https://github.com/hashicorp/levant"
  version "0.3.1"

  if OS.mac?
    url "https://releases.hashicorp.com/levant/0.3.1/levant_0.3.1_darwin_amd64.zip"
    sha256 "e151a7bc01d5861387af9de6c97625e0a96b61d087839f34c057f5a9b6233135"
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
    url "https://releases.hashicorp.com/levant/0.3.1/levant_0.3.1_linux_amd64.zip"
    sha256 "01b4a15a1eb5d6c69178ff383a457a6251658224dd9537fe1ea9f24e07044f76"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/levant/0.3.1/levant_0.3.1_linux_arm.zip"
    sha256 "9b7176f351915e0dbc030ab8347c09ee4f10f8b4f4f807637ef8fc23e42f30c2"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/levant/0.3.1/levant_0.3.1_linux_arm64.zip"
    sha256 "a30190ba4aa5fd7e6b2ef8cd4e0cd949349736f00d215c8c28137c85a0f1ae3d"
  end

  conflicts_with "levant"

  def install
    bin.install "levant"
  end

  test do
    system "#{bin}/levant --version"
  end
end
