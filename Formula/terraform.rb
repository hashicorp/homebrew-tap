# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.8.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.8.2/terraform_1.8.2_darwin_amd64.zip"
    sha256 "a71ada335aba64ac1851ffbb2cf8f727a06013d02474dd70c4571f585b1fe522"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.8.2/terraform_1.8.2_darwin_arm64.zip"
    sha256 "f871f4c91eafec6e6e88253dc3cc0b6a21d63fa56fee5ee1629f3ce68a605873"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.8.2/terraform_1.8.2_linux_amd64.zip"
    sha256 "74f3cc4151e52d94e0ecbe900552adc9b8440b4a8dc12f7fdaab2d0280788acc"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.8.2/terraform_1.8.2_linux_arm.zip"
    sha256 "938c111ff0e0b895347c94e7865ff29edb088e205d715621d2fa63d509eeb163"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.8.2/terraform_1.8.2_linux_arm64.zip"
    sha256 "e00726a0c8e4b06b31873446c639454358a0efb73a604198473f526d60e66100"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
