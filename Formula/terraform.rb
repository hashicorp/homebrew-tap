# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.11.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.11.0/terraform_1.11.0_darwin_amd64.zip"
    sha256 "24b45c11c70160f31f7bf3107173b8e9611c072eba3c0cd0b608fc6ad937eaf3"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.11.0/terraform_1.11.0_darwin_arm64.zip"
    sha256 "ce78084f1ad41c008da242faf84f7653b4f00a4b8443ef2bb5724b135cc68766"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.11.0/terraform_1.11.0_linux_amd64.zip"
    sha256 "069e531fd4651b9b510adbd7e27dd648b88d66d5f369a2059aadbb4baaead1c1"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.11.0/terraform_1.11.0_linux_arm.zip"
    sha256 "916d151d3dfd4aada61f0a269bfde9484582ba0ade049c9e554b8c998d92f9fd"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.11.0/terraform_1.11.0_linux_arm64.zip"
    sha256 "0a7e88cbb431044a16335369f850359def93b2898adc1778063784760db69093"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
