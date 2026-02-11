# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"
  version "1.15.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.15.0/packer_1.15.0_darwin_amd64.zip"
    sha256 "a565b825aed17ac9a7c422b5ed22e6598dd42b9f705de161695853b1f5c6bd80"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/packer/1.15.0/packer_1.15.0_darwin_arm64.zip"
    sha256 "ebd8eb03503627471f39b036ff5dbb24070d21518d59aa8cbf962386257d21a4"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.15.0/packer_1.15.0_linux_amd64.zip"
    sha256 "2fd1149c5c6c7604ced64d7b56638af05f6b7ed3f6835182bc913ddaba1f16b8"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.15.0/packer_1.15.0_linux_arm.zip"
    sha256 "7d5ee19adc7659720f03363c27e914945204eadb633ad5a3c37a3719f20e6eee"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.15.0/packer_1.15.0_linux_arm64.zip"
    sha256 "1687f43bd120601f62e54b970b1cc06f83e95897357dc5c679b57ec9d2fb40a7"
  end

  conflicts_with "packer"

  def install
    bin.install "packer"
  end

  test do
    system "#{bin}/packer --version"
  end
end
