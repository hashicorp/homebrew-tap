# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class TerraformLs < Formula
  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.35.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.35.0/terraform-ls_0.35.0_darwin_amd64.zip"
    sha256 "7d096235bcbfc39fe7371fe16cbcc6d5f6b50181f50487b0dd204c8b7e63fefe"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform-ls/0.35.0/terraform-ls_0.35.0_darwin_arm64.zip"
    sha256 "9853d2bdd2955f674b1bd0b7203fcdf9d291458c3c8a41b8dd8c16edff46710c"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.35.0/terraform-ls_0.35.0_linux_amd64.zip"
    sha256 "e639032c79a3e5a298d3079caed321e171dc0ff9b768ae7e91c4a7ad4b43bc6d"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.35.0/terraform-ls_0.35.0_linux_arm.zip"
    sha256 "3e5a31122038eb303530b391ad0cb0924050ac0bd193f1f15bcd1dc363d92518"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.35.0/terraform-ls_0.35.0_linux_arm64.zip"
    sha256 "ef6cfbdbbc40aaa219cdbf57c53f42b268bb8a9bb131ecbd193879c35544dd61"
  end

  conflicts_with "terraform-ls"

  def install
    bin.install "terraform-ls"
  end

  test do
    system "#{bin}/terraform-ls --version"
  end
end
