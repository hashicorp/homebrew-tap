# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class TerraformLs < Formula
  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.32.7"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.32.7/terraform-ls_0.32.7_darwin_amd64.zip"
    sha256 "5fea6b021e5643d256f96e36f3f8f775b6199b909e3beffe9e7cf21800abedad"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform-ls/0.32.7/terraform-ls_0.32.7_darwin_arm64.zip"
    sha256 "590ff5a2fbb2eca605ba66bc6cf17ea1c50c6bb6332e2c800e6e3c1344b0b0e7"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.32.7/terraform-ls_0.32.7_linux_amd64.zip"
    sha256 "cab95f1af99676d2c3023d1c0fc914e0eae71682c87cef02bf45c9f8d03fbdee"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.32.7/terraform-ls_0.32.7_linux_arm.zip"
    sha256 "e6e3ade0f37b1bb11500907bb9651fd0618a566771697a714e598bb6fae7b0d6"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.32.7/terraform-ls_0.32.7_linux_arm64.zip"
    sha256 "6596a919b86896145c1a23baf791ea9580d0ed00a8525bb0756662533af4c1cd"
  end

  conflicts_with "terraform-ls"

  def install
    bin.install "terraform-ls"
  end

  test do
    system "#{bin}/terraform-ls --version"
  end
end
