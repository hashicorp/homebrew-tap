# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class Tfstacks < Formula
  desc "Terraform Stacks CLI"
  homepage "https://www.terraform.io/"
  version "1.2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tfstacks/1.2.0/tfstacks_1.2.0_darwin_amd64.zip"
    sha256 "d34773cc19e9b873bf4e92420d4db59a071ca28a7443ee0adcadb3c1202e87d5"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/tfstacks/1.2.0/tfstacks_1.2.0_darwin_arm64.zip"
    sha256 "f3c44f8b6aecad884fab324d7cd155a7f1eef966e2ea5164c30ecc98efce7c6a"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/tfstacks/1.2.0/tfstacks_1.2.0_linux_amd64.zip"
    sha256 "b46ea7e8c32b7e27b1f2f89b5de480423003884cc2df767beb2f46fcec72fa59"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tfstacks/1.2.0/tfstacks_1.2.0_linux_arm.zip"
    sha256 "afda090c7e6269c2e26081bfe1d17b79aa1e293b85f7d59a0601f95254be3fea"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/tfstacks/1.2.0/tfstacks_1.2.0_linux_arm64.zip"
    sha256 "ab4654dc5565ef52f8e3e504233b690e9d1d2102ad0a666ad204fbd9cd4fdffc"
  end

  conflicts_with "tfstacks"

  def install
    bin.install "tfstacks"
  end

  test do
    system "#{bin}/tfstacks --version"
  end
end
