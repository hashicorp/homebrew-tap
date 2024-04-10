# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.8.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.8.0/terraform_1.8.0_darwin_amd64.zip"
    sha256 "1aee4f880706edf98efb972d4f5cec2cd4c23904c17a26d51af6326d6f06a64e"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.8.0/terraform_1.8.0_darwin_arm64.zip"
    sha256 "abfb06eb80f1acd19ab8a01f6d24a4a5f99ba9b628c3b00a3b0c898709eea3b3"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.8.0/terraform_1.8.0_linux_amd64.zip"
    sha256 "dcc4670379a22213e72faa6cb709b3391e7e54967e40288ecf591e2b83cfd39e"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.8.0/terraform_1.8.0_linux_arm.zip"
    sha256 "25ecd729af5cf2774625521833cfd17ad92cd418f2342732b08bbcd1107026ed"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.8.0/terraform_1.8.0_linux_arm64.zip"
    sha256 "47cbde7184ce260160ff0355065d454ffa5628a2259ba325736dbcf740351193"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
