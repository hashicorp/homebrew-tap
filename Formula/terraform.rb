# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.7.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.7.1/terraform_1.7.1_darwin_amd64.zip"
    sha256 "db05d272f5070eacab70fc14a091f5a9e6c734423794901d79ffd3c612933235"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.7.1/terraform_1.7.1_darwin_arm64.zip"
    sha256 "d4ee3a591d022fda26e1eb153a25e38ee4f0311720719c329ed38cf2ae8c14e5"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.7.1/terraform_1.7.1_linux_amd64.zip"
    sha256 "64ea53ae52a7e199bd6f647c31613ea4ef18f58116389051b4a34a29fb04624a"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.7.1/terraform_1.7.1_linux_arm.zip"
    sha256 "31608b8e2e816bd750575515b4ecebb48f4ea8d3f9f27b9bd4818bf3b978bbeb"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.7.1/terraform_1.7.1_linux_arm64.zip"
    sha256 "9067cd7e34b3f81aa6e1eca3496dae65573abe3b9e285ec651c1c2fd2f9c43cd"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
