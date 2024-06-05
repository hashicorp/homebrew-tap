# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.8.5"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.8.5/terraform_1.8.5_darwin_amd64.zip"
    sha256 "051c702e156a4d1a1c628783cf2ca0e1db8cca7b4c0f1686ea623558ed5560f9"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.8.5/terraform_1.8.5_darwin_arm64.zip"
    sha256 "627c5005ab4a2bee36316f4967a41f16d55f79ea737f78b6bb34325c728c73e1"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.8.5/terraform_1.8.5_linux_amd64.zip"
    sha256 "bb1ee3e8314da76658002e2e584f2d8854b6def50b7f124e27b957a42ddacfea"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.8.5/terraform_1.8.5_linux_arm.zip"
    sha256 "2cd8cf46c46041c5f46766ec5e96728905df60ef92fd32d9889033ef8c305f46"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.8.5/terraform_1.8.5_linux_arm64.zip"
    sha256 "17b3a243ea24003a58ab324c197da8609fccae136bcb8a424bf61ec475b3a203"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
