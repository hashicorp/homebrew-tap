# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class TerraformLs < Formula
  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.31.5"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.31.5/terraform-ls_0.31.5_darwin_amd64.zip"
    sha256 "d572d496405448cfca1d29d816b7379f2d4e64590a0bd7abe6fcff6617651dd1"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform-ls/0.31.5/terraform-ls_0.31.5_darwin_arm64.zip"
    sha256 "26ea2907a6ba85718d404165d9f2ef623aac6aebefc5693c5c9633824dba6033"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.31.5/terraform-ls_0.31.5_linux_amd64.zip"
    sha256 "a4eba4d8156d66df1d087e6dcaaea335bfaeea5cfa8e822f974be4509049f026"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.31.5/terraform-ls_0.31.5_linux_arm.zip"
    sha256 "9c034356f4cd8468804b0b2f672e3570ccc05f1769c4fdb0f9a5553053d6d33f"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.31.5/terraform-ls_0.31.5_linux_arm64.zip"
    sha256 "a93635caab68d92df24d5a66f8d4b6eae85a1931de0aae56d97815af5ed80c34"
  end

  conflicts_with "terraform-ls"

  def install
    bin.install "terraform-ls"
  end

  test do
    system "#{bin}/terraform-ls --version"
  end
end
