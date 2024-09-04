# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class TerraformLs < Formula
  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.34.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.34.3/terraform-ls_0.34.3_darwin_amd64.zip"
    sha256 "60e1aefe895acb87b62f62cc679e33726a4bb776ae5758e4c78c84a12b3a1245"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform-ls/0.34.3/terraform-ls_0.34.3_darwin_arm64.zip"
    sha256 "9d337d9c868379a717deb650363a1ccd84e309f4de9dbcd44d5f7809ebca66d0"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.34.3/terraform-ls_0.34.3_linux_amd64.zip"
    sha256 "c36805a73af626a102985feddc4ac2d42a2c95580f353e9cb9601b66934cb32d"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.34.3/terraform-ls_0.34.3_linux_arm.zip"
    sha256 "ddbf78642bda6af57703a259e1a39b5b4ea662319e2d6fb33e14cf32d38af02a"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.34.3/terraform-ls_0.34.3_linux_arm64.zip"
    sha256 "1bab3e09984763fe80b6e031b2f55aa6c41591485c4407764aedfcd52d0a04cd"
  end

  conflicts_with "terraform-ls"

  def install
    bin.install "terraform-ls"
  end

  test do
    system "#{bin}/terraform-ls --version"
  end
end
