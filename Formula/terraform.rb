# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.5.7"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.5.7/terraform_1.5.7_darwin_amd64.zip"
    sha256 "b310ec0e626e9799000cfc8e30247cd827cf7f8030c8e0400257c7f111e93537"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.5.7/terraform_1.5.7_darwin_arm64.zip"
    sha256 "db7c33eb1a446b73a443e2c55b532845f7b70cd56100bec4c96f15cfab5f50cb"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.5.7/terraform_1.5.7_linux_amd64.zip"
    sha256 "c0ed7bc32ee52ae255af9982c8c88a7a4c610485cf1d55feeb037eab75fa082c"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.5.7/terraform_1.5.7_linux_arm.zip"
    sha256 "fd77cd3ba76175ecf7554fdf5fb66548f5906cb4944bc7e180b4be0b2196f404"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.5.7/terraform_1.5.7_linux_arm64.zip"
    sha256 "f4b4ad7c6b6088960a667e34495cae490fb072947a9ff266bf5929f5333565e4"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
