# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.12.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.12.2/terraform_1.12.2_darwin_amd64.zip"
    sha256 "c65aa74bed1dbb1c48ba4bbab11f08e7f7eeb54a422146561490275340468f19"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.12.2/terraform_1.12.2_darwin_arm64.zip"
    sha256 "1ca02f336ff4f993d6441806d38a0bcc0bbca0e3c877b84c9c2dc80cfcd0dc8b"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.12.2/terraform_1.12.2_linux_amd64.zip"
    sha256 "1eaed12ca41fcfe094da3d76a7e9aa0639ad3409c43be0103ee9f5a1ff4b7437"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.12.2/terraform_1.12.2_linux_arm.zip"
    sha256 "4d5d39d57755a45b7bb6c6ad7301ac3c301eba44b647e2d0ca79c117cb817259"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.12.2/terraform_1.12.2_linux_arm64.zip"
    sha256 "f8a0347dc5e68e6d60a9fa2db361762e7943ed084a773f28a981d988ceb6fdc9"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
