# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class TerraformLs < Formula
  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.32.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.32.2/terraform-ls_0.32.2_darwin_amd64.zip"
    sha256 "d897eced3310db37af584c42a0e9afffda1a1c23ec442c8be5bec665c32d76b7"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform-ls/0.32.2/terraform-ls_0.32.2_darwin_arm64.zip"
    sha256 "d16d565394c932ecdc950b278c2310713805c08a8183f84523d65f351af80b44"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.32.2/terraform-ls_0.32.2_linux_amd64.zip"
    sha256 "cd3fdacf09e41ea15025df5b881bf3584f4af86ca9d3d757ddc96d12d5f5fbef"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.32.2/terraform-ls_0.32.2_linux_arm.zip"
    sha256 "285d420b8fa03c65c6f613c0cdd07a97c3f4612068ca237abec9d618a7e357db"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.32.2/terraform-ls_0.32.2_linux_arm64.zip"
    sha256 "641c7e90c104ccdef2e9a50c7a1ac1b9146de8aba64385410bba477c0ae16b0c"
  end

  conflicts_with "terraform-ls"

  def install
    bin.install "terraform-ls"
  end

  test do
    system "#{bin}/terraform-ls --version"
  end
end
