# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.6.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.6.1/terraform_1.6.1_darwin_amd64.zip"
    sha256 "48951cc7f15bc028a867642425db720c18f13491007ee218dcc54b5ea0519d17"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.6.1/terraform_1.6.1_darwin_arm64.zip"
    sha256 "85ad9903a48c1b997540d1b9fdd47d7b29cb6be740e7c34f6f8afc7581f4ac8e"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.6.1/terraform_1.6.1_linux_amd64.zip"
    sha256 "d1a778850cc44d9348312c9527f471ea1b7a9213205bb5091ec698f3dc92e2a6"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.6.1/terraform_1.6.1_linux_arm.zip"
    sha256 "c21f46aedd581eac1fce2a779bce1fb58d38cf2c4be83ab3a54a216c638df0ee"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.6.1/terraform_1.6.1_linux_arm64.zip"
    sha256 "ae328d5733657f35233fd228d9a14fccde3b1d19b99158eff1906888b3ca4935"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
