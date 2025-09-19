# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class TerraformLs < Formula
  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.38.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.38.0/terraform-ls_0.38.0_darwin_amd64.zip"
    sha256 "75dab5c6c9cc4cdd5f0163bf64e4e0ab8c654eb266054f8bc453868dbbb61c41"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform-ls/0.38.0/terraform-ls_0.38.0_darwin_arm64.zip"
    sha256 "f689fa10342ae3b1c52b223592734f6d827da544ad593338253b63253fdfb51d"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.38.0/terraform-ls_0.38.0_linux_amd64.zip"
    sha256 "4f9222705f0c1652de1753291863ac7b11fc8c3f4cc310f2806a5b56a6c79a71"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.38.0/terraform-ls_0.38.0_linux_arm.zip"
    sha256 "df15c1ce1a7a1ae4042a1e1c6eb0de3a605d4a48854b42bbbd1a067b629a53d6"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.38.0/terraform-ls_0.38.0_linux_arm64.zip"
    sha256 "966bcf44e12c2e4a57e2d8ab5a4f3a1dbdec7adbe0054e53e191e283a5f68243"
  end

  conflicts_with "terraform-ls"

  def install
    bin.install "terraform-ls"
  end

  test do
    system "#{bin}/terraform-ls --version"
  end
end
