# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.9.8"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.9.8/terraform_1.9.8_darwin_amd64.zip"
    sha256 "be591e8c59c49d0cfbc7664d24910a4b43840b89d0a4bbca662149bbf0397e91"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.9.8/terraform_1.9.8_darwin_arm64.zip"
    sha256 "873d7b925d08578fb6bb9c12c7cd92ae73e289e07c360f2fdd69f9036b7baaab"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.9.8/terraform_1.9.8_linux_amd64.zip"
    sha256 "186e0145f5e5f2eb97cbd785bc78f21bae4ef15119349f6ad4fa535b83b10df8"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.9.8/terraform_1.9.8_linux_arm.zip"
    sha256 "cb6db8471e361bb9ad6bbd43d9c780d37208e6dbe416900fdc8999af9e459b77"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.9.8/terraform_1.9.8_linux_arm64.zip"
    sha256 "f85868798834558239f6148834884008f2722548f84034c9b0f62934b2d73ebb"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
