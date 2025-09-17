# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.13.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.13.3/terraform_1.13.3_darwin_amd64.zip"
    sha256 "5ef8e19091106b1921af26db5bcee3cd84a475eae2fd190fc02b1049b320d042"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.13.3/terraform_1.13.3_darwin_arm64.zip"
    sha256 "8362e7284b38a1194884963deed83481696d468b42dab88052775f4280383584"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.13.3/terraform_1.13.3_linux_amd64.zip"
    sha256 "71fc43d92ea09907be5d416d2405a6a9c2d1ceaed633f5e175c0af26e8c4b365"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.13.3/terraform_1.13.3_linux_arm.zip"
    sha256 "cb4a434b83a11d159c8c172b08e9b11b47458befb4e021f5ce20a894dd50c777"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.13.3/terraform_1.13.3_linux_arm64.zip"
    sha256 "fa82fb1b08354573467557f33e6a15e7f9e1bba74eb15492f151ca27525d2acc"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
