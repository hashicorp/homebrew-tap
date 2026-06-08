# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class TerraformLs < Formula
  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.38.7"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.38.7/terraform-ls_0.38.7_darwin_amd64.zip"
    sha256 "973f0363d94bba14abbb2f188f900263f2578673c4581b4a3150cee760035c00"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform-ls/0.38.7/terraform-ls_0.38.7_darwin_arm64.zip"
    sha256 "f20567880de1a8b915f61e071aab8224c67e5ce116cc5ea5d9afae23fab79d97"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.38.7/terraform-ls_0.38.7_linux_amd64.zip"
    sha256 "b05cdaec4db456f233c48499c838b3c5a0734fe2d3a5d972f673ac8198041c2b"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.38.7/terraform-ls_0.38.7_linux_arm.zip"
    sha256 "c4e9eecca94158a6681202e5aac45ff78109db51ac905c5e6c835cc97da850d8"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.38.7/terraform-ls_0.38.7_linux_arm64.zip"
    sha256 "f14fb99c7977f084a39f5a45299d3d193d28ae4258e96b2e9f05b4d0cf3b2b57"
  end

  conflicts_with "terraform-ls"

  def install
    bin.install "terraform-ls"
  end

  test do
    system "#{bin}/terraform-ls --version"
  end
end
