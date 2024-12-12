# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class TerraformLs < Formula
  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.36.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.36.2/terraform-ls_0.36.2_darwin_amd64.zip"
    sha256 "03079b98997a9c7ef077f6e71c79493e1d9e7c4f0f8c5bcd4ad65094cfdfd3dc"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform-ls/0.36.2/terraform-ls_0.36.2_darwin_arm64.zip"
    sha256 "2a2fe44bac2326f416c1bcd03b0cd249072800cb0984bd7b90ed1ff45f815552"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.36.2/terraform-ls_0.36.2_linux_amd64.zip"
    sha256 "25289a5150d8b27af9eaa139e309622867394b901ff61c73b8478ef36cfb3a65"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.36.2/terraform-ls_0.36.2_linux_arm.zip"
    sha256 "c6e7aeab2a7d3330f09fc1f60fd575ae0d6adc3c872b1da931e61f25eac27a19"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.36.2/terraform-ls_0.36.2_linux_arm64.zip"
    sha256 "18e8ce540710cfb9950d3788fb4bc5b7987bfe5c05117a2782ad52aaecc291f8"
  end

  conflicts_with "terraform-ls"

  def install
    bin.install "terraform-ls"
  end

  test do
    system "#{bin}/terraform-ls --version"
  end
end
