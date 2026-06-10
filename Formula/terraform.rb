# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.15.6"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.15.6/terraform_1.15.6_darwin_amd64.zip"
    sha256 "ec7e3c2d314b5b0c975b6f7f8c6094d1806cb98f64f79e6f971cc87f786eb6e0"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.15.6/terraform_1.15.6_darwin_arm64.zip"
    sha256 "8d4c6791a744332bc7ca3962c61ab2ed8e5d25a7299f176f5edffb9cb525e85f"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.15.6/terraform_1.15.6_linux_amd64.zip"
    sha256 "a7150d3b0e1b5c466ad42e8c499954a3c54645f8b56b385fa025d34f7e88faa9"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.15.6/terraform_1.15.6_linux_arm.zip"
    sha256 "82c3251b9346eb22e9855dde97294333f275326bab85ea969a3c195d6f76bf23"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.15.6/terraform_1.15.6_linux_arm64.zip"
    sha256 "404c9cfa43728d31005f6e7a848b8a7cc701320067d9d87d8850031a5beb37b0"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
