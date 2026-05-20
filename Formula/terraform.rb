# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.15.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.15.4/terraform_1.15.4_darwin_amd64.zip"
    sha256 "5d9d58855d08934fb79e8db04332ff89d5e2218a6a3559f6e596b47ec2f74ecd"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.15.4/terraform_1.15.4_darwin_arm64.zip"
    sha256 "d6b99521a436bfc0e44b18ca47e2c8fec37a74039bf3b529ecc3c71d3e5a9fbf"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.15.4/terraform_1.15.4_linux_amd64.zip"
    sha256 "a71695fa6db9344db02ff1adb69cce891c1b2b4dc31c08df0dd4a12101a33b26"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.15.4/terraform_1.15.4_linux_arm.zip"
    sha256 "4e8a52160bbc8db128e0b9cf9f3a4e64f7788f94e2803b14489085a13ece03fb"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.15.4/terraform_1.15.4_linux_arm64.zip"
    sha256 "87da14c6700fee1bdaffedc943c4aca7bb078aad1f3eeccbdaae0484f90e1bec"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
