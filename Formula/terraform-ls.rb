# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class TerraformLs < Formula
  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.36.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.36.1/terraform-ls_0.36.1_darwin_amd64.zip"
    sha256 "d40082fd6fc8ec5b3a9d03b3577ffe953609ebd1ec341fbbc16fbad1071336e0"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform-ls/0.36.1/terraform-ls_0.36.1_darwin_arm64.zip"
    sha256 "211d9709e78cbb64528a3c4392cd510a07b0bfc7ca9fb18420ce1eceb9694470"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.36.1/terraform-ls_0.36.1_linux_amd64.zip"
    sha256 "bb66a68768751f8ab6422afcac07b41db28189a56c111c3b3a0431dcdbdec817"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.36.1/terraform-ls_0.36.1_linux_arm.zip"
    sha256 "f3633889d3ddcb4b52487f2238bf35df93004dad2bf1829b01adb4788bb2186a"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.36.1/terraform-ls_0.36.1_linux_arm64.zip"
    sha256 "1776d41f9aeb3ff602c50131bec9f8ff22d5180be86362ab589b2fb211235e32"
  end

  conflicts_with "terraform-ls"

  def install
    bin.install "terraform-ls"
  end

  test do
    system "#{bin}/terraform-ls --version"
  end
end
