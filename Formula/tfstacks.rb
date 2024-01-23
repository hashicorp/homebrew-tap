# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform Stacks CLI < Formula
  desc "Terraform Stacks CLI"
  homepage "https://www.terraform.io/"
  version "0.1.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tfstacks/0.1.0/tfstacks_0.1.0_darwin_amd64.zip"
    sha256 "f77b5e71c90aa34b7ccd354f44f06590ff0e6efeb138cd268e63dac4508eaee5"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/tfstacks/0.1.0/tfstacks_0.1.0_darwin_arm64.zip"
    sha256 "467dd4c15db410e91abb703a57502b5c6cbb6539f7455605f887bd2ef0ecc26b"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tfstacks/0.1.0/tfstacks_0.1.0_linux_amd64.zip"
    sha256 "565296ec87300ff7c530ecd67a4c5048d077c7c36694a1bce989dcf1da498122"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tfstacks/0.1.0/tfstacks_0.1.0_linux_arm.zip"
    sha256 "97f00c8d66d6085224856bcb0e7e9bea96d0df7475e6599e69df36c23213d367"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tfstacks/0.1.0/tfstacks_0.1.0_linux_arm64.zip"
    sha256 "e8f1daa1f1bbcf3d404cce95464f7a4d4c522e6b0e9ef8d31d2774db48c070f4"
  end

  conflicts_with "tfstacks"

  def install
    bin.install "tfstacks"
  end

  test do
    system "#{bin}/tfstacks --version"
  end
end
