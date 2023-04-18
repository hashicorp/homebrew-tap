# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class TerraformLs < Formula
  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.31.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.31.0/terraform-ls_0.31.0_darwin_amd64.zip"
    sha256 "4274ae6f070efbcd65ebc5d87193800184c1c798176854a95f8d01302c92d0e2"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform-ls/0.31.0/terraform-ls_0.31.0_darwin_arm64.zip"
    sha256 "29fd463ac7b616d502cb4187d1012f724944bbb4ce06aa91b25d7b569d3402bc"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.31.0/terraform-ls_0.31.0_linux_amd64.zip"
    sha256 "5feafd23f33a6b8da74e5bd6a822bd8fa1e7b8c6060c72a625f2b3f1c588ee83"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.31.0/terraform-ls_0.31.0_linux_arm.zip"
    sha256 "8a7131c4b6a3b0ccd14c1c764f4630df3120697fc00b9d2960a9703c6ae8e413"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.31.0/terraform-ls_0.31.0_linux_arm64.zip"
    sha256 "2cd05063a949481e452b967003bbd448cae9c0aa1b2b946ed3e70dfc9b8fc472"
  end

  conflicts_with "terraform-ls"

  def install
    bin.install "terraform-ls"
  end

  test do
    system "#{bin}/terraform-ls --version"
  end
end
