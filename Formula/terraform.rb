# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.7.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.7.4/terraform_1.7.4_darwin_amd64.zip"
    sha256 "fcf35c8b1d3f46fb84f688312ef5f829081d2d56c10444b9f6e290e21e68871c"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.7.4/terraform_1.7.4_darwin_arm64.zip"
    sha256 "3f25268a5d7677cc89d39a505362979acfb02f19ddb965d7ec0b33a6d9e64075"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.7.4/terraform_1.7.4_linux_amd64.zip"
    sha256 "285539a6fd62fb79f05edc15cc207ca90f282901c32261085ea0642a0d638dfd"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.7.4/terraform_1.7.4_linux_arm.zip"
    sha256 "b8f281a58d9642f3edb437b25796cf189db35dddc81feb6a3d5472029f609283"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.7.4/terraform_1.7.4_linux_arm64.zip"
    sha256 "36680616b54c5ce8c8222c7bf81c187727b3c5c1a3a6e3af5b5372caa28697b7"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
