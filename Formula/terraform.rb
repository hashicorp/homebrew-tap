# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.14.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.14.3/terraform_1.14.3_darwin_amd64.zip"
    sha256 "f88d0c3ff98add0e0288bfc1fe59df15e7fb0302bddef6a7367f734ef213cd02"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.14.3/terraform_1.14.3_darwin_arm64.zip"
    sha256 "c45e74c19f38ec7fcb55f74b9788a75a2cbb07da45343b197ae4a41637e571b6"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.14.3/terraform_1.14.3_linux_amd64.zip"
    sha256 "178b2a602251bb68b94732aceca2cc1023d87597cb83dba92cab31b6689edb4d"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.14.3/terraform_1.14.3_linux_arm.zip"
    sha256 "649034c7594bae11cf367ce362c793f69e6433207c5e35c849e2a68f5b404016"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.14.3/terraform_1.14.3_linux_arm64.zip"
    sha256 "fb5b004070e5e438214a74ddca321c22246f799e5cbe1ee9df582528e953f8cc"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
