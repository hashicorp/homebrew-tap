# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"
  version "1.10.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.10.3/packer_1.10.3_darwin_amd64.zip"
    sha256 "4cfe7ace14c8b0667a18d754be4129c8d6896b11af55f6c4dba73982c81564fe"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/packer/1.10.3/packer_1.10.3_darwin_arm64.zip"
    sha256 "25f786e4b3ddd5d247547329d7ca023a57390168760bf51dd3a7be6c850d46a5"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.10.3/packer_1.10.3_linux_amd64.zip"
    sha256 "12977fde5f4fbbb0a88b4e8dc59c2f899113e57292d02a8bdc0efecf8cb3a9a2"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.10.3/packer_1.10.3_linux_arm.zip"
    sha256 "dc3eb820c4600de63cdb4462935f5914c72ad36e9afbea99893876af63a0e28d"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.10.3/packer_1.10.3_linux_arm64.zip"
    sha256 "5803dc279fc1f1ab98020b9bcb08e9702dab96eda10a5d09c3fbe849f9afb498"
  end

  conflicts_with "packer"

  def install
    bin.install "packer"
  end

  test do
    system "#{bin}/packer --version"
  end
end
