# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class TerraformLs < Formula
  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.36.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.36.4/terraform-ls_0.36.4_darwin_amd64.zip"
    sha256 "b2922591ab77cce52f29e1a6ed99ed7d46124dfbd84073d7eaea06115bb4abad"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform-ls/0.36.4/terraform-ls_0.36.4_darwin_arm64.zip"
    sha256 "e79024c704c48fa3ce50a541153c2d26b9e8b0a851a6f18dc1c81cd57d419532"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.36.4/terraform-ls_0.36.4_linux_amd64.zip"
    sha256 "8af4152d5dfe6502a7a36beefecad3ce999b774fb09767ad44dec9ca96fa9223"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.36.4/terraform-ls_0.36.4_linux_arm.zip"
    sha256 "029f6b5ae5fd4ba02c1b022fad80d5a626cb2022e25e5179d3e954748f1ee181"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.36.4/terraform-ls_0.36.4_linux_arm64.zip"
    sha256 "26bb91c2e8d9f41f35a1cfffd2ead80c7f8db04c7b21c9331f36366732b85fa0"
  end

  conflicts_with "terraform-ls"

  def install
    bin.install "terraform-ls"
  end

  test do
    system "#{bin}/terraform-ls --version"
  end
end
