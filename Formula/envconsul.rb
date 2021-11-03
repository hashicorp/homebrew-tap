class Envconsul < Formula
  desc "Env Consul"
  homepage "https://github.com/hashicorp/envconsul"
  version "0.12.0"

  if OS.mac?
    url "https://releases.hashicorp.com/envconsul/0.12.0/envconsul_0.12.0_darwin_amd64.zip"
    sha256 "f54e6a65890913a174a00540875f0b09735479f283225c0b71e4ead4655bfb1f"
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
    url "https://releases.hashicorp.com/envconsul/0.12.0/envconsul_0.12.0_linux_amd64.zip"
    sha256 "0078233eefe9499ec047057f1a4c1bb781847da0f45959751a33acf613d2566f"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/envconsul/0.12.0/envconsul_0.12.0_linux_arm.zip"
    sha256 "a85bd7496c9daecf292a07103197177f139a8e2bac0162473b294b23f211ad56"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/envconsul/0.12.0/envconsul_0.12.0_linux_arm64.zip"
    sha256 "0e4b9cfaf4346097eea4576d411fe155b71d280e633e57fb273b84c3683292d4"
  end

  conflicts_with "envconsul"

  def install
    bin.install "envconsul"
  end

  test do
    system "#{bin}/envconsul --version"
  end
end
