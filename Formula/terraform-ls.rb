# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class TerraformLs < Formula
  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.31.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.31.1/terraform-ls_0.31.1_darwin_amd64.zip"
    sha256 "f649fdd6e8da924b2735755d19406a4efc2ebb0da525bf9b0f3ec3ea763d25b0"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform-ls/0.31.1/terraform-ls_0.31.1_darwin_arm64.zip"
    sha256 "2fc5455cf76d3b397e8a375e712fba3a200f2b45410a5879e20b1ef92b0b0ca6"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.31.1/terraform-ls_0.31.1_linux_amd64.zip"
    sha256 "76e23b04a2b8174ec4e999be87e1d8d0334262532ce659dc2d66c05c7428918d"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.31.1/terraform-ls_0.31.1_linux_arm.zip"
    sha256 "0767d91eecb5bb2514f9083e2b3669e805b1822d429b033605f0d1c51e38e111"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.31.1/terraform-ls_0.31.1_linux_arm64.zip"
    sha256 "bb91aba5e026dfb896c629a115723bad1e35456de60d7151e512791efb2cf75f"
  end

  conflicts_with "terraform-ls"

  def install
    bin.install "terraform-ls"
  end

  test do
    system "#{bin}/terraform-ls --version"
  end
end
