# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.10.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.10.1/terraform_1.10.1_darwin_amd64.zip"
    sha256 "9e3e0127c7dbef8a34773820736acbb312a0727149a3b5df07b73f0cf859c261"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.10.1/terraform_1.10.1_darwin_arm64.zip"
    sha256 "bae8bef4e19a404427a25e1ddc35eeff4ed9afb675c33e2988dfd47f1543ad3b"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.10.1/terraform_1.10.1_linux_amd64.zip"
    sha256 "d49d4d08ed092a8dec335f1fe3e127d1a285f160557323dd5a84ddc0c8472e1a"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.10.1/terraform_1.10.1_linux_arm.zip"
    sha256 "be437778a3b9c59d5de1cbcc70873a40b07d5fc6ae52c09c9bc5adb93a9c1b84"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.10.1/terraform_1.10.1_linux_arm64.zip"
    sha256 "6375a763b7784e47b4314e939a8c15f357db718d932e82825d87392abb5d1e09"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
