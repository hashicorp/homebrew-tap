# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class TerraformLs < Formula
  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.36.5"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.36.5/terraform-ls_0.36.5_darwin_amd64.zip"
    sha256 "17c5c480f8eec7e528292565f1c05d5097a41edf7ef8ee2a9f3a18d288a1415a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform-ls/0.36.5/terraform-ls_0.36.5_darwin_arm64.zip"
    sha256 "fee8743aa71fe2d8b0b9b91283b844cfa57d58457306a62e53a8f38d143cec8c"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.36.5/terraform-ls_0.36.5_linux_amd64.zip"
    sha256 "37e645cc54fd03e863157e2a3e773e7a5ff1d6cb3d045e4c20860cac1f550a44"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.36.5/terraform-ls_0.36.5_linux_arm.zip"
    sha256 "1a291913d5cc231ae132f4c310b63de2d0cdd9a208400eb6a05684e6ac256071"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.36.5/terraform-ls_0.36.5_linux_arm64.zip"
    sha256 "724f45029f32d02d88b1952c7d1526c59fc8cd5dae49e31b9fed676a83f6cae7"
  end

  conflicts_with "terraform-ls"

  def install
    bin.install "terraform-ls"
  end

  test do
    system "#{bin}/terraform-ls --version"
  end
end
