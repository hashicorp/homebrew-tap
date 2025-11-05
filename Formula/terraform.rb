# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.13.5"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.13.5/terraform_1.13.5_darwin_amd64.zip"
    sha256 "92f76865230cbe6bb747e49cb3dc5b44a054324bbdd1a080bb127b326b94c404"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.13.5/terraform_1.13.5_darwin_arm64.zip"
    sha256 "1bf942231235e7e1a4c38c6d7b820e54f526ac487f87d19f0c4a425c6ddb62cb"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.13.5/terraform_1.13.5_linux_amd64.zip"
    sha256 "0dbe3fcc268eb670801af6a6456799d1ae26e72e73797f6c6167e18aafd1fd9a"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.13.5/terraform_1.13.5_linux_arm.zip"
    sha256 "33ced3ed54c828ece06a9e84f43a8737686640208c0c1d36be830c34012714f0"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.13.5/terraform_1.13.5_linux_arm64.zip"
    sha256 "fc1ddcb403fb57e25bdbdceb1ef2b1a102650c01b4d65dd3410082d2ef8b4417"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
