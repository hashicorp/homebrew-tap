# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class TerraformLs < Formula
  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.32.6"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.32.6/terraform-ls_0.32.6_darwin_amd64.zip"
    sha256 "5559805e6f225c1861bb9886461f0e185fc0a5184b4caa431e7688c08c44bd5d"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform-ls/0.32.6/terraform-ls_0.32.6_darwin_arm64.zip"
    sha256 "9cc5362d5c3011eea0e1aa8b26e2d167f1874cdbabaf6e7a475aa97c14bb9306"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.32.6/terraform-ls_0.32.6_linux_amd64.zip"
    sha256 "96c83cce08c813982c6ce758b4ac3a2ad31d638e5ee95b0fc7f5274bd9d50883"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.32.6/terraform-ls_0.32.6_linux_arm.zip"
    sha256 "2e26be0359808cc65db9ac42d52b7a4a66f739090a3354c09f976a7e88cdc821"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.32.6/terraform-ls_0.32.6_linux_arm64.zip"
    sha256 "7995de423652033c0bc7ee99dffb84eade455b60aa94d6ecadd806712ff7249a"
  end

  conflicts_with "terraform-ls"

  def install
    bin.install "terraform-ls"
  end

  test do
    system "#{bin}/terraform-ls --version"
  end
end
