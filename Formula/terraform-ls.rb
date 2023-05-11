# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class TerraformLs < Formula
  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.31.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.31.2/terraform-ls_0.31.2_darwin_amd64.zip"
    sha256 "e74ccb7da1a05be9a014d54916f46f0274cae1123ac546ba746b4f71b736191f"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform-ls/0.31.2/terraform-ls_0.31.2_darwin_arm64.zip"
    sha256 "090f84f385d86439b1c7a542e4575e3a7a48bede99a079c6a094d448af73e052"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.31.2/terraform-ls_0.31.2_linux_amd64.zip"
    sha256 "e1fa0f6446218a8247ed34a730d075091a51b2aa7e3a5f1b35ddc96716df87d6"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.31.2/terraform-ls_0.31.2_linux_arm.zip"
    sha256 "0a174ec538a9d2c652872a9f9674ad693d3925c1e7ad420c3e5ceff6c36efcc6"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.31.2/terraform-ls_0.31.2_linux_arm64.zip"
    sha256 "9c8770b578f8ab0ac6f64e39e880ca342c8c869e04230b7dbff9e730e8630a3d"
  end

  conflicts_with "terraform-ls"

  def install
    bin.install "terraform-ls"
  end

  test do
    system "#{bin}/terraform-ls --version"
  end
end
