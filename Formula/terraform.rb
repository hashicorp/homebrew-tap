# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.5.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.5.1/terraform_1.5.1_darwin_amd64.zip"
    sha256 "4f9f518b40399a9271dd8e449a6335ec94a4de60fc8789711ede7a4b9e630a47"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.5.1/terraform_1.5.1_darwin_arm64.zip"
    sha256 "f691b79319bd82daac2d8b6cbb595d3e8523296c4cd20bf7da0d12fe9eefdfa7"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.5.1/terraform_1.5.1_linux_amd64.zip"
    sha256 "31754361a9b16564454104bfae8dd40fc6b0c754401c51c58a1023b5e193aa29"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.5.1/terraform_1.5.1_linux_arm.zip"
    sha256 "940117c09b4ac486e4095e64a16f1012d77a83435737527ff3d9c7b2b9ad18fd"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.5.1/terraform_1.5.1_linux_arm64.zip"
    sha256 "7799fc8f167fa4071024b11cb2fc186fdab18d9bede761d3f1cdffad7ab19df0"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
