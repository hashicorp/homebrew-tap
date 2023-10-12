# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class TerraformLs < Formula
  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.32.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.32.1/terraform-ls_0.32.1_darwin_amd64.zip"
    sha256 "c49cea5f06d34c4a6e2a1036a38a9cadc21838046a47e62175895723c7f11586"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform-ls/0.32.1/terraform-ls_0.32.1_darwin_arm64.zip"
    sha256 "8cb9421a21e67bdfc3c215d06f27f54f23b5aa9c373c8cd27c72b224b13e4125"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.32.1/terraform-ls_0.32.1_linux_amd64.zip"
    sha256 "132c2f28f2c10689d82ef79883f41040ecd52215148612abdab059f4832d9d52"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.32.1/terraform-ls_0.32.1_linux_arm.zip"
    sha256 "aa25601c9afb89b35b47653ea63d9483eb3d459260ee9f87881ac7db9b2908da"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.32.1/terraform-ls_0.32.1_linux_arm64.zip"
    sha256 "2a75a0491c6121aef01eb2f2ae5096ef3c7bc38b11fdca952c8ac47e7de79994"
  end

  conflicts_with "terraform-ls"

  def install
    bin.install "terraform-ls"
  end

  test do
    system "#{bin}/terraform-ls --version"
  end
end
