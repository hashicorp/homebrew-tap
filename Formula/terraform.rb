# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.14.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.14.0/terraform_1.14.0_darwin_amd64.zip"
    sha256 "bcb92ac63ab038ed633fe99a86553a9f4595d078dd607ad0b0145d7e65d153d1"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.14.0/terraform_1.14.0_darwin_arm64.zip"
    sha256 "57fde1cc2534a7e8c48aaae2ad2954084502852c25d731fc957e4b831f75e16e"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.14.0/terraform_1.14.0_linux_amd64.zip"
    sha256 "33ac217458ba8b44ce2813553083bc132c9a07e41a79c2e3627977682d283093"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.14.0/terraform_1.14.0_linux_arm.zip"
    sha256 "6388284e9a6bb37b7a386131c6dde9b975eea172170f064e2cc42dffcc572d16"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.14.0/terraform_1.14.0_linux_arm64.zip"
    sha256 "23d5e9b3f4014f18f85e242a5a8bbaf6d31b058a31d93580e5fe5da644bf8013"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
