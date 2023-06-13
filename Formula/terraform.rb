# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.5.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.5.0/terraform_1.5.0_darwin_amd64.zip"
    sha256 "dd64d8a2a75519b933b4f1d76417675ea66bdb45c2a2672cf511825091eba789"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.5.0/terraform_1.5.0_darwin_arm64.zip"
    sha256 "0765371227ab09e1bb64d606fcfe3d157a2992ac3b82ffabfb9976db53bd791e"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.5.0/terraform_1.5.0_linux_amd64.zip"
    sha256 "9ae1bcfef088e9aaabeaf6fdc6cce01187dc4936f1564899ee6fa6baec5ad19c"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.5.0/terraform_1.5.0_linux_arm.zip"
    sha256 "833559af90ff54f2ebcf9f70f9043e2d3fb54c1a0c38711f2522a16f909dc852"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.5.0/terraform_1.5.0_linux_arm64.zip"
    sha256 "7d0bb120dc90dc05011f7a6c7c027f2ac1b13c0d5721b8c935f2f440e539a968"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
