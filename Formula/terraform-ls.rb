# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class TerraformLs < Formula
  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.36.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.36.0/terraform-ls_0.36.0_darwin_amd64.zip"
    sha256 "1f661a2440de6912b3dea0b78d0f4ebfcdf66c1ab8f1831c75566589a641335f"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform-ls/0.36.0/terraform-ls_0.36.0_darwin_arm64.zip"
    sha256 "330e16f4598847df062ee40c6e311eced4e3de5fce846dad6e44b19a08feab90"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.36.0/terraform-ls_0.36.0_linux_amd64.zip"
    sha256 "0de88901fa500ed52d5b846b4236f84e5344c80dab55784fcedf149ce472f314"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.36.0/terraform-ls_0.36.0_linux_arm.zip"
    sha256 "f528b417b919acd70d334f85320a0c9f4d462cc52ef9c8ba59bcad3f392efaf5"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.36.0/terraform-ls_0.36.0_linux_arm64.zip"
    sha256 "97ad00c2af5dd4f5f816ad7e75e8ecbdf6fb7f871bc0c1fced2c060e6fa81d36"
  end

  conflicts_with "terraform-ls"

  def install
    bin.install "terraform-ls"
  end

  test do
    system "#{bin}/terraform-ls --version"
  end
end
