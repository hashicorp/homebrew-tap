# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class TerraformLs < Formula
  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.32.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.32.3/terraform-ls_0.32.3_darwin_amd64.zip"
    sha256 "6563b907cb3266d6df5a4730f52f8ea708e17f024a3d0155d3ddcf5a6da63a11"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform-ls/0.32.3/terraform-ls_0.32.3_darwin_arm64.zip"
    sha256 "c04e3757d4449972a9c93cd37bb6dd35fe2666bfae0526ddd0de6e4aba151137"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.32.3/terraform-ls_0.32.3_linux_amd64.zip"
    sha256 "ac4b4709799d1a5783008ea6d66943ba2d5d60439e022a7302ee13a7201b7623"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.32.3/terraform-ls_0.32.3_linux_arm.zip"
    sha256 "2413c7a764e5c2ad2da426a3e2f7dd0b436882a0781929136433eb6410e8ff4f"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.32.3/terraform-ls_0.32.3_linux_arm64.zip"
    sha256 "2d0312b88c22b8d8b0418ee0dcb6adee00bea29495083d5b49374dc541c5cfec"
  end

  conflicts_with "terraform-ls"

  def install
    bin.install "terraform-ls"
  end

  test do
    system "#{bin}/terraform-ls --version"
  end
end
