# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.16.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.16.0/terraform_1.16.0_darwin_amd64.zip"
    sha256 "2b2b7d37f6893474fa3622fa96053e54949c4ddfca4aba105380718157936465"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.16.0/terraform_1.16.0_darwin_arm64.zip"
    sha256 "5dd692c6cc76b596029ff3c2b2b4c3a1710f92d3de6d2da3f66bd2e0c2daa92a"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.16.0/terraform_1.16.0_linux_amd64.zip"
    sha256 "41d05b927aa174f15d1228c4eba832a323b716c68b415ef5a00179f46cc602d3"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.16.0/terraform_1.16.0_linux_arm.zip"
    sha256 "ae6f7a891fa7d65b30d7c1cebcd02b2ea2998632ec3def200b4fb9d3d3f135c9"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.16.0/terraform_1.16.0_linux_arm64.zip"
    sha256 "60f86cea49a653e22a93c000f16cbfa391ce41c6f6a11d36557c35da411f684c"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
