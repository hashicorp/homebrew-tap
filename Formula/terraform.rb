# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.14.8"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.14.8/terraform_1.14.8_darwin_amd64.zip"
    sha256 "26dd7593d22e9d99ec09380f0869718f649be7b7f954d888611335e6a84961f8"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.14.8/terraform_1.14.8_darwin_arm64.zip"
    sha256 "5593670a2d42323847bfb216db17c73a44df201a62f7587928bae16adeabba23"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.14.8/terraform_1.14.8_linux_amd64.zip"
    sha256 "56a5d12f47cbc1c6bedb8f5426ae7d5df984d1929572c24b56f4c82e9f9bf709"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.14.8/terraform_1.14.8_linux_arm.zip"
    sha256 "4bed85ecc7f3d73826920ac5b57c02efeb04fa3b72f16d0b01921a94fd7252dc"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.14.8/terraform_1.14.8_linux_arm64.zip"
    sha256 "c953171cde6b25ca0448c3b29a90d2f46c0310121e18742ec8f89631768e770c"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
