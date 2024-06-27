# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class TerraformLs < Formula
  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.33.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.33.3/terraform-ls_0.33.3_darwin_amd64.zip"
    sha256 "54b7b33ec3a7175224fee8d73838765c801325b34f4607c9935a6d9e7172d749"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform-ls/0.33.3/terraform-ls_0.33.3_darwin_arm64.zip"
    sha256 "3f3dc8fd8613b63d4bca7dd9458ffe91a4fc0787e440a04927117dc0454469af"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.33.3/terraform-ls_0.33.3_linux_amd64.zip"
    sha256 "e1d95a8f44b55a782097de6f9094138a54e5cf51a12eab33e2055e428ab50900"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.33.3/terraform-ls_0.33.3_linux_arm.zip"
    sha256 "67e38bc67179929ec4a67da90f905ae418003d129aecc3240f3f164b382b3bdb"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.33.3/terraform-ls_0.33.3_linux_arm64.zip"
    sha256 "3539821cbab587a53ebb0533c370ddf15d66e4bf0448d9560611e4f7ab9f1156"
  end

  conflicts_with "terraform-ls"

  def install
    bin.install "terraform-ls"
  end

  test do
    system "#{bin}/terraform-ls --version"
  end
end
