# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.14.6"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.14.6/terraform_1.14.6_darwin_amd64.zip"
    sha256 "ae13b4d204b00a0742f13a3de78a78994918f31333b1537db682cd0a7085dac0"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.14.6/terraform_1.14.6_darwin_arm64.zip"
    sha256 "5d91a8d6877e792de00be8db2324a2561edeb312ec2ff141b877131b82622c76"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.14.6/terraform_1.14.6_linux_amd64.zip"
    sha256 "364c6ee08b0cb8fcbb28a115aacb2aa48e88abc56c149170bd65c2f75d98ea8d"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.14.6/terraform_1.14.6_linux_arm.zip"
    sha256 "8c750fb16d2bb12a41449f0dadac6dea67535c66a05a6def13f28f97538e60c5"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.14.6/terraform_1.14.6_linux_arm64.zip"
    sha256 "190037f64695556ac75965c00da5d85b3663f38553d909e9a51c4490cba4b6c1"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
