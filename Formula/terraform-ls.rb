# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class TerraformLs < Formula
  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.33.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.33.1/terraform-ls_0.33.1_darwin_amd64.zip"
    sha256 "61a89082ad468d96cd3a166be31bdf3dae3bf2e9c73dc6f0e456b7ac46425be8"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform-ls/0.33.1/terraform-ls_0.33.1_darwin_arm64.zip"
    sha256 "df5fff2831a3106910d1cf8a9581da0f3667d8c8bad88b02024a7aa4047794a8"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.33.1/terraform-ls_0.33.1_linux_amd64.zip"
    sha256 "dcdb71e11c8140fd70186fe4e5c7238e35464d3824c38005a5c6cb7393e48100"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.33.1/terraform-ls_0.33.1_linux_arm.zip"
    sha256 "f6bff0f06b2efb15ae9330a4e20f47d42dd982a76d8ec609d1bf48516233d13c"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.33.1/terraform-ls_0.33.1_linux_arm64.zip"
    sha256 "e86724314229c334d43e72eb81e95b3184399c9412abc5c972251f9998ea058a"
  end

  conflicts_with "terraform-ls"

  def install
    bin.install "terraform-ls"
  end

  test do
    system "#{bin}/terraform-ls --version"
  end
end
