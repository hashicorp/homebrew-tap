# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class TerraformLs < Formula
  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.33.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.33.0/terraform-ls_0.33.0_darwin_amd64.zip"
    sha256 "0dd90e0c44452c9b884781df4c47adc59b9e0cd0abf3daa954a6dd60a4e1fb96"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform-ls/0.33.0/terraform-ls_0.33.0_darwin_arm64.zip"
    sha256 "3fd8b1ccb94ee4f858c65bad4be468b991a77de4fd541fec6a8f99b33d044573"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.33.0/terraform-ls_0.33.0_linux_amd64.zip"
    sha256 "5b8b0b496b69e5eb158e68a4206faae6b94c0588d880552acc2dda9e87845469"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.33.0/terraform-ls_0.33.0_linux_arm.zip"
    sha256 "8ffa978e611a1f65fd60d7c99cb68b2d692b9b3cdc9d043c78d51e3975406b11"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.33.0/terraform-ls_0.33.0_linux_arm64.zip"
    sha256 "d7963947ce342c1ec28de94c79b8a993173504c173e43582cd6701a6125e3fbb"
  end

  conflicts_with "terraform-ls"

  def install
    bin.install "terraform-ls"
  end

  test do
    system "#{bin}/terraform-ls --version"
  end
end
