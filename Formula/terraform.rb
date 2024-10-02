# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.9.7"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.9.7/terraform_1.9.7_darwin_amd64.zip"
    sha256 "c35d5e978f5edbc398bbc9ccc89840b173c66978e1cdb6fc8a48c5c42346dd55"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.9.7/terraform_1.9.7_darwin_arm64.zip"
    sha256 "0cdc2e21d0843a14379414e722806954d78b0439e8a7001f7500276bfc12eed4"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.9.7/terraform_1.9.7_linux_amd64.zip"
    sha256 "76a77ed7e785ef354b7f565abaa990e3e7b5232d3ec4afb87e0f5a413fcbdad1"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.9.7/terraform_1.9.7_linux_arm.zip"
    sha256 "14f0a10f9fed64a22581c32b7e0ad675065f8470f32cef6d5be29c29928dcd3b"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.9.7/terraform_1.9.7_linux_arm64.zip"
    sha256 "8fc6f1172ff026abc4f0c399996fa454e605bfc1df6793af82d922a66b5c41f8"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
