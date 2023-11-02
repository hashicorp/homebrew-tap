# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.6.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.6.3/terraform_1.6.3_darwin_amd64.zip"
    sha256 "6fbd1ba3d64daad05d9384568f7300ee9f15e18a5f3a19a33fe48b8d1b44385a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.6.3/terraform_1.6.3_darwin_arm64.zip"
    sha256 "8cad19d5f34c6ab2af21219fc3968ba30084f5e39bf219230706d360869ed8e9"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.6.3/terraform_1.6.3_linux_amd64.zip"
    sha256 "caa432f110db519bf9b7c84df23ead398e59b6cc3da2938f010200f1ee8f2ae4"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.6.3/terraform_1.6.3_linux_arm.zip"
    sha256 "e180ff62badecbf4e0a4f71d628812d73981bab650533b0c2facb2bc10d9ccac"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.6.3/terraform_1.6.3_linux_arm64.zip"
    sha256 "01d8dc9bda3d4de585d5901c5099d9155faeb0730fbd9dc6c6e13735cba76700"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
