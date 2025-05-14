# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.12.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.12.0/terraform_1.12.0_darwin_amd64.zip"
    sha256 "7516b58d79f9c261498e54f26f5e6684da379d0b44956121f832b9e3302baf24"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.12.0/terraform_1.12.0_darwin_arm64.zip"
    sha256 "4e6cab902bd43d218ba3e921a3d80d4c9e5056d9d5badbac7190741afc095506"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.12.0/terraform_1.12.0_linux_amd64.zip"
    sha256 "c71fd5d500a7e4d869bf5d12176c72d1dfc00440b862116797694361671f77c8"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.12.0/terraform_1.12.0_linux_arm.zip"
    sha256 "c7f9a2e0ddba0b1ddbf17b3dec3dd4c5cd72f7397a92f9df38b9ff3ce7d4b693"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.12.0/terraform_1.12.0_linux_arm64.zip"
    sha256 "8174792e28419601db6445f3252f792bc84c14358f6fe1c65d2951d89b36fadf"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
