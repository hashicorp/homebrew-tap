# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.13.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.13.0/terraform_1.13.0_darwin_amd64.zip"
    sha256 "025c9ba20c542a22197157bf4a69cfbc8b3e43a9b69e9884d8ffcf9349cfdf0b"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.13.0/terraform_1.13.0_darwin_arm64.zip"
    sha256 "7c36802149ebe94a5ac435539baa16f68304587386c83617977ba23fa96efcb1"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.13.0/terraform_1.13.0_linux_amd64.zip"
    sha256 "de8ef905f84f24675da202a6967fddc40b2b23c15fc92a5007570f46a9fcc104"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.13.0/terraform_1.13.0_linux_arm.zip"
    sha256 "d76a52b9e8dc083a5a4d24b617ef6a1d2f347619291dbd2d643767e2bfcedccb"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.13.0/terraform_1.13.0_linux_arm64.zip"
    sha256 "e35a908e406536ef1ba7b853dc0e0fed141630e04ba4b8004edeea1919aac385"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
