# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.14.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.14.2/terraform_1.14.2_darwin_amd64.zip"
    sha256 "62fca69aa1fc3093a522182ab86ed0c5095fafc146b432cd52dca861c0a3545b"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.14.2/terraform_1.14.2_darwin_arm64.zip"
    sha256 "c81719634fc5f325b3711e8b9c5444bd0d7b8590b0b9aa2ff8f00ff50a9d60c8"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.14.2/terraform_1.14.2_linux_amd64.zip"
    sha256 "8314673d57e9fb8e01bfc98d074f51f7efb6e55484cfb2b10baed686de2190da"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.14.2/terraform_1.14.2_linux_arm.zip"
    sha256 "01e5a239ad96bc40f37d6eca8cd8b6b0a72ffb227162574c0144a7d0e0741f86"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.14.2/terraform_1.14.2_linux_arm64.zip"
    sha256 "8c9911595ad5079bc34692d75f5ae23a0630868db2b891eef43724411cb5ec88"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
