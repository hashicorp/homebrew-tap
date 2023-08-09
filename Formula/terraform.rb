# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.5.5"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.5.5/terraform_1.5.5_darwin_amd64.zip"
    sha256 "6d61639e2141b7c23a9219c63994f729aa41f91110a1aa08b8a37969fb45e229"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.5.5/terraform_1.5.5_darwin_arm64.zip"
    sha256 "c7fdeddb4739fdd5bada9d45fd786e2cbaf6e9e364693eee45c83e95281dad3a"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.5.5/terraform_1.5.5_linux_amd64.zip"
    sha256 "ad0c696c870c8525357b5127680cd79c0bdf58179af9acd091d43b1d6482da4a"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.5.5/terraform_1.5.5_linux_arm.zip"
    sha256 "172f2b195156be282e9014e286e2d98f1467e4fb822d8f9013672ad4b751a3e9"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.5.5/terraform_1.5.5_linux_arm64.zip"
    sha256 "b055aefe343d0b710d8a7afd31aeb702b37bbf4493bb9385a709991e48dfbcd2"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
