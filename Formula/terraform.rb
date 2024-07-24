# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.9.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.9.3/terraform_1.9.3_darwin_amd64.zip"
    sha256 "858f851ccb786faa7e4f098707d66d77a6b5e6028b75e82cdf6bda68b93922a9"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.9.3/terraform_1.9.3_darwin_arm64.zip"
    sha256 "168cfeb339dbbfea6be651573ec168e6ca08bab79a4fc0474681eee1e9a95de9"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.9.3/terraform_1.9.3_linux_amd64.zip"
    sha256 "e52520cf6d677155e69a8fcfe64054891f4d991802b0d36d4c8b670d60a7e899"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.9.3/terraform_1.9.3_linux_arm.zip"
    sha256 "0d3cbbfc97bc2cb3bf08cdb9dbabc17d8e2dabb0aedf60d752c51f14d3501ce2"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.9.3/terraform_1.9.3_linux_arm64.zip"
    sha256 "193ce269aafd5c44f359cd73a75c5cc7aaab924eb5c3601784c1873575828ec7"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
