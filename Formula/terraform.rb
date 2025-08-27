# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.13.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.13.1/terraform_1.13.1_darwin_amd64.zip"
    sha256 "ababbfdb3bab9ac7ca10cb1e71dd5f7fb1ac10b5faf6d842e84524932d9c5ca4"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.13.1/terraform_1.13.1_darwin_arm64.zip"
    sha256 "2e067a85882eed25fd966abfb763ae32075940e7b505eb3cd7e592360615d67d"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.13.1/terraform_1.13.1_linux_amd64.zip"
    sha256 "4449e2ddc0dee283f0909dd603eaf98edeebaa950f4635cea94f2caf0ffacc5a"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.13.1/terraform_1.13.1_linux_arm.zip"
    sha256 "dc983c8178c8cbe174a8265c0073092deb3704f767571a1a3254927284de982f"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.13.1/terraform_1.13.1_linux_arm64.zip"
    sha256 "2bb0787c2da1ad94d6a495a848aad4e9b572adb02bfc7361afeee80f07fd90ac"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
