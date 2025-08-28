# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class TerraformLs < Formula
  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.37.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.37.0/terraform-ls_0.37.0_darwin_amd64.zip"
    sha256 "a268f5227c0326f66f27dd339673dfb7f3a6b2ae66e1432cf94e259e71b6a0c4"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform-ls/0.37.0/terraform-ls_0.37.0_darwin_arm64.zip"
    sha256 "6b1dd57770600fd2b9fbf5ab2397dc92cac6d9fe1279d455f2e430b34a34e989"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.37.0/terraform-ls_0.37.0_linux_amd64.zip"
    sha256 "75d95926f416240c0b7f6a0db4369176e0110053ee08598617258a2038060f26"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.37.0/terraform-ls_0.37.0_linux_arm.zip"
    sha256 "c93996fafbd4a334a9421086865d4292782cd423e0a0d1351d235a7eadb1bc8b"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.37.0/terraform-ls_0.37.0_linux_arm64.zip"
    sha256 "8f74714fe24a855243b71aba18b3656c00a3854bdfe07166ef718522d0dcef84"
  end

  conflicts_with "terraform-ls"

  def install
    bin.install "terraform-ls"
  end

  test do
    system "#{bin}/terraform-ls --version"
  end
end
