# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.9.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.9.1/terraform_1.9.1_darwin_amd64.zip"
    sha256 "047c98b6cc7e4ecce51a02a02b0e9596dd5d94034756ba6a42fe4e5c6f16e4c0"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.9.1/terraform_1.9.1_darwin_arm64.zip"
    sha256 "6767c4302a1cf164d92091f66bd399732bff681e4ae9f60533a05fc3449d227d"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.9.1/terraform_1.9.1_linux_amd64.zip"
    sha256 "c3e1dade1c81fdc5e293529e480709f047c0113ea9feb8d9f35002df09ec6a34"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.9.1/terraform_1.9.1_linux_arm.zip"
    sha256 "43e9520b222daadda3640524e6e8941d0f4f453df0fe99e93265a7c7f9d7afea"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.9.1/terraform_1.9.1_linux_arm64.zip"
    sha256 "f1426fccbf2500202b37993ef6b92e1fc60d114dd32c79bfadbc843929b2c7e2"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
