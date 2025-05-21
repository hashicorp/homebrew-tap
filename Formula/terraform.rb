# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.12.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.12.1/terraform_1.12.1_darwin_amd64.zip"
    sha256 "bb5bc5c846a4b41b414a6598775a27e3fbb0405ef9b36a61789df5639a9860f5"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.12.1/terraform_1.12.1_darwin_arm64.zip"
    sha256 "30dd56df622fc4d477f24abe7c19856c4c1c22284e20db6d7fa4c53bcfacfb20"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.12.1/terraform_1.12.1_linux_amd64.zip"
    sha256 "dcaf8ba801660a431a6769ec44ba53b66c1ad44637512ef3961f7ffe4397ef7c"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.12.1/terraform_1.12.1_linux_arm.zip"
    sha256 "552a2dba27b8da9c0f59342a854c5b0e77250362c83964b84a8d0e2defb59ef2"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.12.1/terraform_1.12.1_linux_arm64.zip"
    sha256 "70e8c1776646f2af83ccad6113b8bb4768e6f7dc65335ae11ffd095eca3b0d4c"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
