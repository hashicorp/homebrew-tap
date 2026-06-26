# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class Packer < Formula
  desc "Machine image builder"
  homepage "https://www.packer.io/"
  version "1.15.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.15.4/packer_1.15.4_darwin_amd64.zip"
    sha256 "b3be60b44dcb74e7962afe22cc10b89a09c74b626fcd52f49ecee32b07b99e71"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/packer/1.15.4/packer_1.15.4_darwin_arm64.zip"
    sha256 "d95ba177dd2ebb84d7d155493b4188ec2a519d2c3b041528db5b63a6aff9da80"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.15.4/packer_1.15.4_linux_amd64.zip"
    sha256 "15f97a6a99645c7d5308c609973b5280837b38e112beac413ccbce80da927cf1"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.15.4/packer_1.15.4_linux_arm.zip"
    sha256 "b4830f7963fc34de7281e1d3a6e5dbb1d492334237f9247ec8dd2b13c552a409"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.15.4/packer_1.15.4_linux_arm64.zip"
    sha256 "23e6d2e596dd9e2527e0f7bea9aedd26059729375a0d17c462c2621f1b97b82d"
  end

  def install
    bin.install "packer"
  end

  test do
    system bin/"packer", "--version"
  end
end
