class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"
  version "1.7.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.7.4/packer_1.7.4_darwin_amd64.zip"
    sha256 "7fe8e59d9c456e98e52c9dcbca53009659da31f4fa2bf0dda5af43ebcc688685"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/packer/1.7.4/packer_1.7.4_darwin_arm64.zip"
    sha256 "db02f611f2ef160798999f01ac08f7761a4fd0225b301b33276f0a44336e6d87"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.7.4/packer_1.7.4_linux_amd64.zip"
    sha256 "3660064a56a174a6da5c37ee6b36107098c6b37e35cc84feb2f7f7519081b1b0"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.7.4/packer_1.7.4_linux_arm.zip"
    sha256 "0e0ed3aef57056a23f9c45fb1f1e6cb3e9f875dc09556ae504f49cb3029b0718"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.7.4/packer_1.7.4_linux_arm64.zip"
    sha256 "8b71236de6a6e8363721998f840bbbd7c67e356dc82109a37c84c1e9148bfd0e"
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
