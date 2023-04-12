# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.4.5"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.4.5/terraform_1.4.5_darwin_amd64.zip"
    sha256 "808e54d826737e9a0ca79bbe29330e50d3622bbeeb26066c63b371a291731711"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.4.5/terraform_1.4.5_darwin_arm64.zip"
    sha256 "7104d9d13632aa61b494a349c589048d21bd550e579404c3a41c4932e4d6aa97"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.4.5/terraform_1.4.5_linux_amd64.zip"
    sha256 "ce10e941cd11554b15a189cd00191c05abc20dff865599d361bdb863c5f406a9"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.4.5/terraform_1.4.5_linux_arm.zip"
    sha256 "c2617d9415a1cc9bbccce53ea5b5ae85b025e419e2ca47e3b3c993fd7b143cdb"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.4.5/terraform_1.4.5_linux_arm64.zip"
    sha256 "ca2c48f518f72fef668255150cc5e63b92545edc62a05939bbff8a350bceb357"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
