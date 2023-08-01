# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class TerraformLs < Formula
  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.31.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.31.4/terraform-ls_0.31.4_darwin_amd64.zip"
    sha256 "c3cc6cb0e162b49d3fa41a474fe28a7bd810613bcffa605ae25661eb66299b9f"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform-ls/0.31.4/terraform-ls_0.31.4_darwin_arm64.zip"
    sha256 "499aa55358e89f1ee39519f1a763ebaba253f3e73211674dd821a2bb308f7a84"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.31.4/terraform-ls_0.31.4_linux_amd64.zip"
    sha256 "de4bc63036c4c707550ad8eb7a8a38482e52fbaec5371f382f9397fa58f0ce76"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.31.4/terraform-ls_0.31.4_linux_arm.zip"
    sha256 "c207f1ba479047730ee59dea07876c513d41dfb759820022b5113e7a75bcc348"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.31.4/terraform-ls_0.31.4_linux_arm64.zip"
    sha256 "c9e90824923ac15e5211073082642f155f314185beaff845562232d1cf0b4d6a"
  end

  conflicts_with "terraform-ls"

  def install
    bin.install "terraform-ls"
  end

  test do
    system "#{bin}/terraform-ls --version"
  end
end
