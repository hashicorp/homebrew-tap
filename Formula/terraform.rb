# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.9.5"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.9.5/terraform_1.9.5_darwin_amd64.zip"
    sha256 "c28945c377d04b1d237f704729258234c471c8c4f617a1303042862f708ebbc6"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.9.5/terraform_1.9.5_darwin_arm64.zip"
    sha256 "b7eca5cd6f0f6644d45d8708c1b864e64a9e26c355d2c9b585faa049f640fe71"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.9.5/terraform_1.9.5_linux_amd64.zip"
    sha256 "9cf727b4d6bd2d4d2908f08bd282f9e4809d6c3071c3b8ebe53558bee6dc913b"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.9.5/terraform_1.9.5_linux_arm.zip"
    sha256 "6a6436ce51a72317bd3f72fddb06e2f7ee19bd4f1a39d10e64fefd0491722e35"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.9.5/terraform_1.9.5_linux_arm64.zip"
    sha256 "adb3206971bc73fd37c7b50399ef79fe5610b03d3f2d1783d91e119422a113fd"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
