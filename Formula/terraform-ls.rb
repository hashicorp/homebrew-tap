# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class TerraformLs < Formula
  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.34.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.34.1/terraform-ls_0.34.1_darwin_amd64.zip"
    sha256 "ef84f5822f4642aa485956ae376281940a2a7260fe3951adda4a51cd0f2ee5b9"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform-ls/0.34.1/terraform-ls_0.34.1_darwin_arm64.zip"
    sha256 "a2d50203645414b5c0deb1eaf0df0ccabda525e0b6f9a231a96ffc1c023d8616"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.34.1/terraform-ls_0.34.1_linux_amd64.zip"
    sha256 "a97a244aec470da0bd2964fd4e35c69f8abe91479f87c113a886dc86513d517c"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.34.1/terraform-ls_0.34.1_linux_arm.zip"
    sha256 "a11e45bd36520e9bbb924e33b6a2cf1c1b9385a8acef55b6ecda467311a1f5db"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.34.1/terraform-ls_0.34.1_linux_arm64.zip"
    sha256 "f4c1fe19f05d657ee331b5f1f0e93fc55f0efef8d463543b00c7c5e3d91adc0b"
  end

  conflicts_with "terraform-ls"

  def install
    bin.install "terraform-ls"
  end

  test do
    system "#{bin}/terraform-ls --version"
  end
end
