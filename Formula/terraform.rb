# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.6.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.6.2/terraform_1.6.2_darwin_amd64.zip"
    sha256 "361ffd98f0cdee631cb1475688471c5fb8f41bd6a4d8d300f29df384c82d6316"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.6.2/terraform_1.6.2_darwin_arm64.zip"
    sha256 "87345e9f2932c29c8d00c5ca9e0361fada18accc2573fd66883b3adb40949be8"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.6.2/terraform_1.6.2_linux_amd64.zip"
    sha256 "107142241b12ff78b6eb9c419757d406a8714704f7928750a662ba19de055e98"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.6.2/terraform_1.6.2_linux_arm.zip"
    sha256 "b0a5f94cc36b71d0eced8f82ac6a6db7a0e8c9753bf392ab0ddc7cddcd18035f"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.6.2/terraform_1.6.2_linux_arm64.zip"
    sha256 "ac70f54865d1c0a945d3efa221074e32a3818c666a412148ee5f9f0b14fd330d"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
