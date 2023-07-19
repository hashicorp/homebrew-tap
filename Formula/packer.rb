# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"
  version "1.9.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.9.2/packer_1.9.2_darwin_amd64.zip"
    sha256 "b3ed88d414c6dca69d2173b5f03d6bf8e2f9b65110b86dfff3b979373ef5305a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/packer/1.9.2/packer_1.9.2_darwin_arm64.zip"
    sha256 "d8e49cf30f085f1889bd16eb6a2fb44b2ff716d2c1560c9531c5e382bf813965"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.9.2/packer_1.9.2_linux_amd64.zip"
    sha256 "34fe48d0d5f99670af15d8a3b581db7ce9d08093ce37240d7c7b996de7947275"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.9.2/packer_1.9.2_linux_arm.zip"
    sha256 "efa82f5c853ceef0adf67bd2968aad2de89f82f7cc197604eddfa0d5c6c82ff8"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.9.2/packer_1.9.2_linux_arm64.zip"
    sha256 "001f0c8e85742bf2c2f9ef751ec1d6b1d2fdf8ea3c1db4b1abb77340c5e28fc8"
  end

  conflicts_with "packer"

  def install
    bin.install "packer"
  end

  test do
    system "#{bin}/packer --version"
  end
end
