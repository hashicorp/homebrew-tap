class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"
  version "1.7.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.7.3/packer_1.7.3_darwin_amd64.zip"
    sha256 "aa64cc001134ffc7e1f40186dd01822242a146304f646c2dd31e441193e6a688"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/packer/1.7.3/packer_1.7.3_darwin_arm64.zip"
    sha256 "a5e98c6b427233897cf0378c945d8d42becb90eaeae6cbff1d7fffbd34d0a084"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.7.3/packer_1.7.3_linux_amd64.zip"
    sha256 "1a8719f0797e9e45abd98d2eb38099b09e5566ec212453052d2f21facc990c73"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.7.3/packer_1.7.3_linux_arm.zip"
    sha256 "dad9229074e100a43ea8493f3d442ef22731c78385c440f83a281f60cbd7e87d"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.7.3/packer_1.7.3_linux_arm64.zip"
    sha256 "130bbebaff4219ac7bddce765dba8e438cfbf86d429ba04a0a60083d30185bd5"
  end

  bottle :unneeded

  conflicts_with "packer"

  def install
    bin.install "packer"
  end

  test do
    system "#{bin}/packer --version"
  end
end
