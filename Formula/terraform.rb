# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.7.5"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.7.5/terraform_1.7.5_darwin_amd64.zip"
    sha256 "0eaf64e28f82e2defd06f7a6f3187d8cea03d5d9fcd2af54f549a6c32d6833f7"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.7.5/terraform_1.7.5_darwin_arm64.zip"
    sha256 "99c4d4feafb0183af2f7fbe07beeea6f83e5f5a29ae29fee3168b6810e37ff98"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.7.5/terraform_1.7.5_linux_amd64.zip"
    sha256 "3ff056b5e8259003f67fd0f0ed7229499cfb0b41f3ff55cc184088589994f7a5"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.7.5/terraform_1.7.5_linux_arm.zip"
    sha256 "4e74db9394d5cdf0f91cf8fecd290216edf6cf06273eb8f55e35f26eac4a936a"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.7.5/terraform_1.7.5_linux_arm64.zip"
    sha256 "08631c385667dd28f03b3a3f77cb980393af4a2fcfc2236c148a678ad9150c8c"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
