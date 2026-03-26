# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"
  version "1.15.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.15.1/packer_1.15.1_darwin_amd64.zip"
    sha256 "b574a86fae94f097cfce1b49830efa35071125496b6ca6f4f4665c5a7717d55d"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/packer/1.15.1/packer_1.15.1_darwin_arm64.zip"
    sha256 "dc7101854964dce31d379f9a66a1b3256381242dd670dcad25add6f2f299d934"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.15.1/packer_1.15.1_linux_amd64.zip"
    sha256 "648d704bec73805a5508ed612185a9e5858ca7d57b730b88b1a54c3af3a91f5f"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.15.1/packer_1.15.1_linux_arm.zip"
    sha256 "b2f3b0d138f78c4ced18f63e92e78944f71466b2c23ee2c082d2dacf1f76391f"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.15.1/packer_1.15.1_linux_arm64.zip"
    sha256 "a8d68f1746ecacaf8fa9d364aa086249958a0a1f67c90b8a4f165ff024c0e58e"
  end

  conflicts_with "packer"

  def install
    bin.install "packer"
  end

  test do
    system "#{bin}/packer --version"
  end
end
